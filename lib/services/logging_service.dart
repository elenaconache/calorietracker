import 'package:flutter/widgets.dart';

class LoggingService {
  void info(String? message) => debugPrint(message);

  void handle(dynamic error, StackTrace stackTrace) {
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
  }
}
