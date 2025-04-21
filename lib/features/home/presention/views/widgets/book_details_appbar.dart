import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 48),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.x,
                color: Colors.white,
                size: 22.29,
              )),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
