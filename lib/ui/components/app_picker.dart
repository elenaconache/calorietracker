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
        const SizedBox(height: 20),
        Center(child: Text(label)),
        SizedBox(
          height: 250,
          child: CupertinoPicker(
            magnification: 1.2,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 50,
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
