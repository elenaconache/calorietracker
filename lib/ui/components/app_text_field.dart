import 'package:flutter/material.dart';

// TODO: on tap outside, should clear focus from this text field
class AppTextField extends StatelessWidget {
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onSuffixIconPressed;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputAction? action;
  final Function(String)? onSubmitted;
  final TextInputType? inputType;
  final int? maxLength;
  final bool autofocus;

  const AppTextField({
    super.key,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.labelText,
    this.controller,
    this.action,
    this.onSubmitted,
    this.prefixIcon,
    this.inputType,
    this.maxLength,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: _defaultBorder,
          focusedBorder: _buildFocusedBorder(context),
          contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: prefixIcon != null ? 0 : 16, right: suffixIcon != null ? 0 : 16),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: 24,
                )
              : null,
          suffixIcon: IconButton(
            icon: Icon(
              suffixIcon,
              size: 24,
            ),
            onPressed: onSuffixIconPressed,
          ),
          labelText: labelText,
          counter: const SizedBox.shrink()),
      controller: controller,
      cursorWidth: 1,
      textInputAction: action,
      onSubmitted: onSubmitted,
      keyboardType: inputType,
      maxLength: maxLength,
      autofocus: autofocus,
    );
  }

  OutlineInputBorder get _defaultBorder =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: const BorderSide(color: Colors.blueGrey, width: 1));

  OutlineInputBorder _buildFocusedBorder(BuildContext context) =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1));
}
