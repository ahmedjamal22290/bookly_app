import 'package:flutter/material.dart';

class SugessionListItem extends StatelessWidget {
  const SugessionListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        height: 112,
        child: AspectRatio(
          aspectRatio: 70 / 112,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.pink, borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              'assets/images/tset_image.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
