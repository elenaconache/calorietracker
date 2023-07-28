import 'package:flutter/cupertino.dart';

class DiaryController {
  final ValueNotifier<bool> enabledMacrosPercentageMode = ValueNotifier(false);

  void toggleMacrosMode() => enabledMacrosPercentageMode.value = !enabledMacrosPercentageMode.value;
}
