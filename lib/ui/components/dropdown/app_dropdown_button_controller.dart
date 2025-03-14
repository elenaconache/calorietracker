import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppDropdownButtonController {
  final ValueNotifier<bool> isOpen = ValueNotifier(false);
}
