import 'dart:async';

import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: CustomAnimatedName(),
        ),
        SizedBox(height: 20),
        Center(child: Text('Ahmed Jamal', style: Styles.textStyle18)),
        Center(child: Text('ahmedj22', style: Styles.textStyle14)),
      ],
    ));
  }
}

class CustomAnimatedName extends StatefulWidget {
  const CustomAnimatedName({
    super.key,
  });

  @override
  State<CustomAnimatedName> createState() => _CustomAnimatedNameState();
}

class _CustomAnimatedNameState extends State<CustomAnimatedName>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Timer _timer;
  bool isForward = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _colorAnimation =
        ColorTween(end: Colors.white.withOpacity(0.7), begin: Colors.deepPurple)
            .animate(_controller);
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (isForward) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      isForward = !isForward;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, _) {
          return Icon(
            FontAwesomeIcons.solidCircleUser,
            size: 105,
            color: _colorAnimation.value,
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }
}
