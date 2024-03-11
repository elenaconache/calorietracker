import 'package:flutter/material.dart';

const _borderRadius = 4.0;

class AppTextField extends StatefulWidget {
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
  final bool enabled;
  final String? Function(String? text)? validate;
  final bool? isDense;
  final String? hint;
  final Color? textColor;

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
    this.enabled = true,
    this.validate,
    this.isDense,
    this.hint,
    this.textColor,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();

  static const maxTextInputLength = 100;
  static const maxNumericInputLength = 9;
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _textController;
  late final bool _hasInitialTextController;
  late final ValueNotifier<String?> _error;

  @override
  void initState() {
    super.initState();
    _hasInitialTextController = widget.controller != null;
    _error = ValueNotifier(null);
    _textController = (widget.controller ?? TextEditingController());
    _textController.addListener(_onTextChange);
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChange);
    if (!_hasInitialTextController) {
      _textController.dispose();
    }
    _error.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _error,
        builder: (context, error, child) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                  decoration: _getDecoration(context, error),
                  controller: _textController,
                  cursorWidth: 1,
                  textInputAction: widget.action,
                  onFieldSubmitted: widget.onSubmitted,
                  keyboardType: widget.inputType,
                  maxLength: widget.maxLength,
                  autofocus: widget.autofocus,
                  enabled: widget.enabled,
                  validator: (value) => _validateField(value, error),
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  autocorrect: false,
                  style: widget.textColor == null
                      ? null
                      : Theme.of(context).textTheme.bodyLarge?.copyWith(color: widget.textColor)),
              if (error != null)
                Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 16),
                    child: Text(
                      error,
                      style:
                          Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.error),
                    ))
            ]));
  }

  InputDecoration _getDecoration(BuildContext context, String? error) => InputDecoration(
        enabledBorder: _defaultBorder,
        disabledBorder: _disabledBorder,
        focusedBorder: _getFocusedBorder(context),
        focusedErrorBorder: error != null
            ? _getErrorBorder(context)
            : FocusScope.of(context).hasFocus
                ? _getFocusedBorder(context)
                : _defaultBorder,
        errorBorder: error != null ? _getErrorBorder(context) : _defaultBorder,
        contentPadding: _contentPadding,
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                size: 24,
              )
            : null,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                icon: Icon(
                  widget.suffixIcon,
                  size: 24,
                ),
                onPressed: widget.onSuffixIconPressed,
              )
            : null,
        labelText: widget.labelText,
        labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: error != null ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary,
            ),
        counterStyle: const TextStyle(height: 0),
        errorText: null,
        errorStyle: const TextStyle(height: 0),
        isDense: widget.isDense,
        counter: const SizedBox.shrink(),
        hintText: widget.hint,
      );

  EdgeInsets get _contentPadding {
    return EdgeInsets.only(
      top: 12,
      bottom: 0,
      left: widget.prefixIcon != null ? 0 : 16,
      right: widget.suffixIcon != null ? 0 : 16,
    );
  }

  OutlineInputBorder get _defaultBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      );

  OutlineInputBorder get _disabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: const BorderSide(color: Colors.grey, width: 0.5),
      );

  OutlineInputBorder _getFocusedBorder(BuildContext context) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
      );

  void _onTextChange() {
    final error = widget.validate?.call(_textController.text);
    if ((_hasError && error != _error.value) || error == null) {
      _error.value = error;
    }
  }

  bool get _hasError => _error.value != null;

  OutlineInputBorder _getErrorBorder(BuildContext context) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 2),
      );

  String? _validateField(String? value, String? error) {
    final validationResult = widget.validate?.call(value);
    if (error != validationResult) {
      _error.value = validationResult;
    }
    return validationResult != null ? '' : null;
  }
}
