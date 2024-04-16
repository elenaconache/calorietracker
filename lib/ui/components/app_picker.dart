import 'package:flutter/cupertino.dart';

class AppPicker extends StatelessWidget {
  final String label;

  const AppPicker({super.key, required this.label});

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
            scrollController: FixedExtentScrollController(initialItem: 50),
            onSelectedItemChanged: (int _) {},
            children: List<Widget>.generate(
              100,
              (int index) => Center(
                child: Text((index + 1).toString()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
