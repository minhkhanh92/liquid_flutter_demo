import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations localizations(BuildContext context) =>
    AppLocalizations.of(context)!;

String getErrorMessage(BuildContext context, dynamic error) {
  if (error is String) {
    return error;
  }

  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return localizations(context).timeoutErrorMessage;
      case DioErrorType.other:
        if (error.error is SocketException) {
          return localizations(context).connectErrorMessage;
        }
        break;
      default:
        break;
    }
  }

  return localizations(context).unknownErrorMessage;
}
