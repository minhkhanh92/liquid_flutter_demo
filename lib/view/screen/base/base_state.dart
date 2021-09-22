import 'package:flutter/material.dart';
import 'package:liquid_demo/di/locator.dart';
import 'package:liquid_demo/liquid.dart';
import 'package:provider/provider.dart';

import 'base_model.dart';

abstract class BaseState<M extends BaseModel, W extends StatefulWidget>
    extends State<W> {
  late M model;

  @override
  void initState() {
    super.initState();
    model = createModel();
    onModelReady();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<M>.value(
      value: model,
      child: Consumer<M>(
          builder: (context, model, child) => buildViewByState(context, model)),
    );
  }

  Widget buildViewByState(BuildContext context, M model) {
    switch (model.viewState) {
      case ViewState.loading:
        return LoadingWidget();
      case ViewState.error:
        return ErrorViewWidget(
          message: getErrorMessage(context, model.error),
          onRetry: onRetry,
        );
      case ViewState.loaded:
        return buildContentView(context, model);
      default:
        return Container();
    }
  }

  M createModel() => locator<M>();
  Widget buildContentView(BuildContext context, M model);

  void onModelReady() {}
  void onRetry() {}
}

@optionalTypeArgs
mixin BaseAutomaticKeepAliveClientMixin<M extends BaseModel,
    T extends StatefulWidget> on BaseState<M, T> {
  KeepAliveHandle? _keepAliveHandle;

  void _ensureKeepAlive() {
    assert(_keepAliveHandle == null);
    _keepAliveHandle = KeepAliveHandle();
    KeepAliveNotification(_keepAliveHandle!).dispatch(context);
  }

  void _releaseKeepAlive() {
    _keepAliveHandle!.release();
    _keepAliveHandle = null;
  }

  /// Whether the current instance should be kept alive.
  ///
  /// Call [updateKeepAlive] whenever this getter's value changes.
  @protected
  bool get wantKeepAlive => true;

  /// Ensures that any [AutomaticKeepAlive] ancestors are in a good state, by
  /// firing a [KeepAliveNotification] or triggering the [KeepAliveHandle] as
  /// appropriate.
  @protected
  void updateKeepAlive() {
    if (wantKeepAlive) {
      if (_keepAliveHandle == null) _ensureKeepAlive();
    } else {
      if (_keepAliveHandle != null) _releaseKeepAlive();
    }
  }

  @override
  void initState() {
    super.initState();
    if (wantKeepAlive) _ensureKeepAlive();
  }

  @override
  void deactivate() {
    if (_keepAliveHandle != null) _releaseKeepAlive();
    super.deactivate();
  }

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    if (wantKeepAlive && _keepAliveHandle == null) _ensureKeepAlive();
    return super.build(context);
  }
}
