import 'dart:async';

import 'package:dreader/app.dart';
import 'package:dreader/page/error_page.dart';
import 'package:flutter/material.dart';

void main() {
  runZoned(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return ErrorPage(
          errorMessage:
              details.exception.toString() + "\n " + details.stack.toString(),
          details: details);
    };
    runApp(DReaderApp());
  }, onError: (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}
