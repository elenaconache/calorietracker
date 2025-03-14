import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class DiaryController {
  final ValueNotifier<bool> enabledMacrosPercentageMode = ValueNotifier(false);

  void toggleMacrosMode() => enabledMacrosPercentageMode.value = !enabledMacrosPercentageMode.value;
}
