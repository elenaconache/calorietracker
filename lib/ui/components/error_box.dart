import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String message;
  final AnimationController animationController;
  final VoidCallback onErrorDismissed;

  const ErrorBox({super.key, required this.message, required this.animationController, required this.onErrorDismissed});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
        axis: Axis.vertical,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.errorContainer,
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: Row(children: [
                Expanded(
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
                AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) => Opacity(
                        opacity: animationController.status == AnimationStatus.forward ? 1.0 - animationController.value : animationController.value,
                        child: IconButton(
                            onPressed: onErrorDismissed,
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                              size: 24,
                            )))),
              ])),
        ));
  }
}
