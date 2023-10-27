import 'dart:developer';

import 'package:flutter/widgets.dart';

class LoggingService {
  void info(String? message) => debugPrint(message);

  void handle(dynamic error, StackTrace stackTrace) {
    debugPrint(error.toString());
    log(stackTrace.toString());
  }
}
