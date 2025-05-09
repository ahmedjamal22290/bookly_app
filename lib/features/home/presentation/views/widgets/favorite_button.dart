import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 200,
        child: IconButton(
          onPressed: () {
            fav = fav ? false : true;
            setState(() {});
          },
          icon: Icon(
            fav ? Icons.favorite : Icons.favorite_border,
            size: 35,
            color: fav ? Colors.red : Colors.grey,
            shadows: const [
              Shadow(
                blurRadius: 30,
                color: Colors.black,
              )
            ],
          ),
        ));
  }
}
