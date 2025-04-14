import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presention/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CustomAppBar()],
    );
  }
}
