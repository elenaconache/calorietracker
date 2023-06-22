import 'package:flutter/material.dart';

const _borderRadius = BorderRadius.all(Radius.circular(4.0));

class DropdownButtonContent<T> extends StatelessWidget {
  final bool isOpen;
  final T? selectedOption;
  final String Function(T value) optionNameMapper;
  final String hint;

  const DropdownButtonContent({super.key, required this.isOpen, this.selectedOption, required this.hint, required this.optionNameMapper});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: _getDecoration(isOpen, context),
        child:
            Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: Text(selectedOption != null ? optionNameMapper(selectedOption as T) : hint,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: selectedOption != null ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                      ),
                  overflow: TextOverflow.ellipsis)),
          const SizedBox(width: 16),
          Icon(isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down_outlined, color: Theme.of(context).colorScheme.secondary, size: 24)
        ]));
  }

  InputDecoration _getDecoration(bool isOpen, BuildContext context) => InputDecoration(
      focusedBorder: _getFocusedBorder(context),
      enabledBorder: isOpen ? _getFocusedBorder(context) : _getEnabledBorder(context),
      labelText: selectedOption == null ? null : hint,
      floatingLabelStyle: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: isOpen ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary),
      contentPadding: const EdgeInsets.only(left: 16, right: 10, top: 2, bottom: 2));

  OutlineInputBorder _getFocusedBorder(BuildContext context) => OutlineInputBorder(
      borderRadius: _borderRadius,
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 1,
      ));

  OutlineInputBorder _getEnabledBorder(BuildContext context) => OutlineInputBorder(
      borderRadius: _borderRadius,
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 1.0,
      ));
}
