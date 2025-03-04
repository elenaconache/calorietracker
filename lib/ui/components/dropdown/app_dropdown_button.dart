import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/ui/components/dropdown/app_dropdown_button_content.dart';
import 'package:calorietracker/ui/components/dropdown/app_dropdown_menu.dart';
import 'package:flutter/material.dart';

import 'app_dropdown_button_controller.dart';

const _borderRadius = BorderRadius.all(Radius.circular(4.0));
const _height = 48.0;

// TODO: clear focus / show default decoration on tap outside or when pop up not opened
class AppDropdownButton<T> extends StatefulWidget {
  final String hint;
  final List<T> options;
  final Function(T? value)? onChanged;
  final T? selectedOption;
  final String Function(T value) optionNameMapper;
  final bool enabled;

  const AppDropdownButton({
    super.key,
    required this.hint,
    required this.options,
    required this.onChanged,
    this.selectedOption,
    required this.optionNameMapper,
    this.enabled = true,
  });

  @override
  State<AppDropdownButton> createState() => _AppDropdownButtonState<T>();
}

class _AppDropdownButtonState<T> extends State<AppDropdownButton<T>> with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late final AnimationController _animationController;
  late final AppDropdownButtonController _controller;

  @override
  void initState() {
    super.initState();
    _controller = locator<AppDropdownButtonController>();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    _controller.isOpen.dispose();
    _animationController.stop();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
        link: _layerLink,
        child: SizedBox(
            height: _height,
            child: InkWell(
                borderRadius: _borderRadius,
                onTap: widget.enabled ? _toggleDropdown : null,
                child: ValueListenableBuilder(
                    valueListenable: _controller.isOpen,
                    builder: (context, isOpen, child) => DropdownButtonContent<T>(
                        enabled: widget.enabled,
                        isOpen: isOpen,
                        hint: widget.hint,
                        optionNameMapper: widget.optionNameMapper,
                        selectedOption: widget.selectedOption)))));
  }

  void _toggleDropdown({bool close = false}) async {
    if (_controller.isOpen.value || close) {
      await _animationController.reverse();
      _overlayEntry?.remove();
      _controller.isOpen.value = false;
    } else {
      _overlayEntry ??= _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      _controller.isOpen.value = true;
      _animationController.forward();
    }
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    final topOffset = offset.dy + size.height;
    return OverlayEntry(
        builder: (context) => GestureDetector(
            onTap: () => _toggleDropdown(close: true),
            behavior: HitTestBehavior.translucent,
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  Positioned(
                      left: offset.dx,
                      top: topOffset,
                      width: size.width,
                      child: CompositedTransformFollower(
                          offset: Offset(0, size.height),
                          link: _layerLink,
                          showWhenUnlinked: false,
                          child: AppDropdownMenu<T>(
                            animationController: _animationController,
                            maxHeight:
                                (MediaQuery.of(context).size.height - topOffset).isNegative ? 100 : MediaQuery.of(context).size.height - topOffset,
                            options: widget.options,
                            onItemTap: (item) {
                              widget.onChanged?.call(item);
                              _toggleDropdown();
                            },
                            optionNameMapper: widget.optionNameMapper,
                          )))
                ]))));
  }
}
