import 'package:flutter/cupertino.dart';

class AppPicker extends StatelessWidget {
  final String label;
  final int initialValue;
  final Function(int value) onValuePicked;

  const AppPicker({super.key, required this.label, required this.initialValue, required this.onValuePicked});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 30),
        Center(child: Text(label)),
        SizedBox(
          height: 200,
          child: CupertinoPicker(
            magnification: 1.1,
            squeeze: 1.3,
            useMagnifier: true,
            itemExtent: 40,
            scrollController: FixedExtentScrollController(initialItem: initialValue),
            onSelectedItemChanged: onValuePicked,
            children: List<Widget>.generate(
              101,
              (int index) => Center(
                child: Text(index.toString()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
