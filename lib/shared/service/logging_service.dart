import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoggingService {
  void info(String? message) => debugPrint(message);

  void handle(dynamic error, StackTrace stackTrace) {
    debugPrint(error.toString());
    log(stackTrace.toString());
  }
}
