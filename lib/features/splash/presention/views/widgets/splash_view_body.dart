import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/splash/presention/views/widgets/slide_fade_animated_text.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> fadeAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 260));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, -2), end: Offset.zero)
            .animate(_animationController);
    fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 4),
        SlideFadeAnimatedText(
          slidingAnimation: slidingAnimation,
          fadeAnimation: fadeAnimation,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
