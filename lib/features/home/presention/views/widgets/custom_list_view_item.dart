import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.625,
      child: AspectRatio(
        aspectRatio: 150 / 224,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/tset_image.png'),
            ),
            color: Colors.green,
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }
}
