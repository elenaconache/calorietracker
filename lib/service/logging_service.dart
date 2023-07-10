import 'package:flutter/widgets.dart';

class LoggingService {
  void info(String? message) => debugPrint(message);

  void handle(Exception exception, StackTrace stackTrace) {
    debugPrint(exception.toString());
    debugPrint(stackTrace.toString());
  }
}
