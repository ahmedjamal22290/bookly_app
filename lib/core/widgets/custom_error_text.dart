import 'package:flutter/material.dart';

class CustomErrorText extends StatelessWidget {
  const CustomErrorText({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
