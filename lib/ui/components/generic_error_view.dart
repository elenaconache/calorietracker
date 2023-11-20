import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class GenericErrorView extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const GenericErrorView({super.key,  this.buttonText,  this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 36,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.generalErrorMessage,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          if(buttonText != null)
          Center(
            child: TextButton(
              onPressed: onButtonPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.chevron_left, size: 36),
                  Text(
                    buttonText!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(width: 36)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
