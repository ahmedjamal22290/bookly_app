import 'package:flutter/material.dart';

class SlideFadeAnimatedText extends StatelessWidget {
  const SlideFadeAnimatedText({
    super.key,
    required this.slidingAnimation,
    required this.fadeAnimation,
  });

  final Animation<Offset> slidingAnimation;
  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: slidingAnimation,
              child: const Text(
                'Read Free Books',
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
  }
}
