import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookDetails');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: AspectRatio(
          aspectRatio: 150 / 224,
          child: Container(
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
      ),
    );
  }
}
