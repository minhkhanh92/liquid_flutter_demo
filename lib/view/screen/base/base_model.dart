import 'package:flutter/cupertino.dart';

abstract class BaseModel extends ChangeNotifier {
  late ViewState viewState;
  dynamic error;

  ViewState get initState => ViewState.initial;

  BaseModel() {
    viewState = initState;
  }

  loadData() async {
    try {
      setState(ViewState.loading);
      await loadDataInternal();
      setState(ViewState.loaded);
    } catch (e, stackTrace) {
      setState(ViewState.error, error: e, stackTrace: stackTrace);
    }
  }

  @protected
  loadDataInternal() async {}

  setState(ViewState newState,
      {dynamic error, StackTrace? stackTrace, forceUpdate = false}) {
    if (viewState == newState && !forceUpdate) return;

    viewState = newState;
    if (viewState == ViewState.error && error != null) {
      this.error = error;
      trackError(error, stackTrace);
    }
    notifyListeners();
  }

  trackError(dynamic error, StackTrace? stackTrace) {
    // TODO track error
    print(error);
    print(stackTrace);
  }
}

mixin ProgressModel {
  ValueNotifier<ProgressState> progressState =
      ValueNotifier(ProgressState.initial);
}

enum ViewState { initial, loading, loaded, error }
enum ProgressState { initial, processing, success, error }
