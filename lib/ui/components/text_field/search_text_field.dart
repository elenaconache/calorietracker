import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;

  const SearchTextField({
    super.key,
    this.labelText,
    this.controller,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      prefixIcon: Icons.search,
      suffixIcon: Icons.clear,
      onSuffixIconPressed: _clearSearchQuery,
      labelText: labelText,
      controller: controller,
      action: TextInputAction.search,
      onSubmitted: onSubmitted,
      isDense: true,
    );
  }

  void _clearSearchQuery() => controller?.clear();
}
