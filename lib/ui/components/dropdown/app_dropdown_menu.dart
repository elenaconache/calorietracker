import 'package:flutter/material.dart';

const _borderRadius = BorderRadius.all(Radius.circular(4.0));

class AppDropdownMenu<T> extends StatefulWidget {
  final AnimationController animationController;
  final double maxHeight;
  final List<T> options;
  final Function(T item) onItemTap;
  final String Function(T item) optionNameMapper;

  const AppDropdownMenu(
      {super.key,
      required this.animationController,
      required this.maxHeight,
      required this.options,
      required this.onItemTap,
      required this.optionNameMapper});

  @override
  State<AppDropdownMenu> createState() => _AppDropdownMenuState<T>();
}

class _AppDropdownMenuState<T> extends State<AppDropdownMenu<T>> with SingleTickerProviderStateMixin {
  late final Animation<double> _expandAnimation;

  @override
  void initState() {
    _expandAnimation = CurvedAnimation(
      parent: widget.animationController,
      curve: Curves.easeInOut,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: _borderRadius),
        child: SizeTransition(
            axisAlignment: 1,
            sizeFactor: _expandAnimation,
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: widget.maxHeight,
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 8),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = widget.options[index];
                    return Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () => widget.onItemTap(item),
                            child: Padding(
                                padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 24),
                                child: Text(
                                  widget.optionNameMapper(item),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                ))));
                  },
                  itemCount: widget.options.length,
                ))));
  }
}
