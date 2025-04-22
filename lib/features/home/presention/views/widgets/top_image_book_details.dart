import 'package:flutter/material.dart';

class TopImageBookDetails extends StatelessWidget {
  const TopImageBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 243,
      child: AspectRatio(
          aspectRatio: 162 / 243,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Image.asset(
              'assets/images/tset_image.png',
              fit: BoxFit.fill,
            ),
          )),
    );
  }
}
