import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppCarousel extends StatefulWidget {
  final List<Widget> items;

  const AppCarousel({super.key, required this.items});

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  late final PageController _indicatorController;

  @override
  void initState() {
    super.initState();
    _indicatorController = PageController();
  }

  @override
  void dispose() {
    _indicatorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 160,
            child: PageView(
              controller: _indicatorController,
              children: widget.items,
            )),
        const SizedBox(height: 8),
        Center(
            child: SmoothPageIndicator(
          controller: _indicatorController,
          count: widget.items.length,
          effect: ScaleEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Theme.of(context).colorScheme.primary,
            scale: 1.5,
            dotColor: Theme.of(context).disabledColor,
          ),
          onDotClicked: (index) => _indicatorController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.bounceInOut),
        )),
      ],
    );
  }
}
