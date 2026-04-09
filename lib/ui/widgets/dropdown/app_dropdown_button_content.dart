import 'package:flutter/material.dart';

const _borderRadius = BorderRadius.all(Radius.circular(4.0));

class DropdownButtonContent<T> extends StatelessWidget {
  final bool isOpen;
  final T? selectedOption;
  final String Function(T value) optionNameMapper;
  final String hint;
  final bool enabled;

  const DropdownButtonContent({
    super.key,
    required this.isOpen,
    this.selectedOption,
    required this.hint,
    required this.optionNameMapper,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: _getDecoration(context),
        child:
            Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: Text(selectedOption != null ? optionNameMapper(selectedOption as T) : hint,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: selectedOption != null
                            ? null
                            : enabled
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).disabledColor,
                      ),
                  overflow: TextOverflow.ellipsis)),
          const SizedBox(width: 16),
          Icon(
            isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down_outlined,
            color: enabled ? Theme.of(context).colorScheme.secondary : Theme.of(context).disabledColor,
            size: 24,
          )
        ]));
  }

  InputDecoration _getDecoration(BuildContext context) => InputDecoration(
      focusedBorder: _getFocusedBorder(context),
      enabledBorder: isOpen ? _getFocusedBorder(context) : _getEnabledBorder(context),
      disabledBorder: _getDisabledBorder(context),
      labelText: selectedOption == null ? null : hint,
      enabled: enabled,
      floatingLabelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: isOpen
              ? Theme.of(context).colorScheme.primary
              : enabled
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).disabledColor),
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

  OutlineInputBorder _getDisabledBorder(BuildContext context) => OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide(
          color: Theme.of(context).disabledColor,
          width: 1.0,
        ),
      );
}
