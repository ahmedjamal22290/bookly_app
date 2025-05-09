import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _sizeAnimation;

  bool fav = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _sizeAnimation = Tween<double>(begin: 35, end: 40)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sizeAnimation,
      builder: (context, child) {
        return Positioned(
            top: 190,
            child: IconButton(
              onPressed: () {
                fav = !fav;

                _controller.forward();
              },
              icon: Icon(
                Icons.favorite,
                size: _sizeAnimation.value,
                color: fav ? Colors.red.shade700 : Colors.grey.shade600,
                shadows: const [
                  Shadow(
                    blurRadius: 25,
                    color: Colors.black,
                  )
                ],
              ),
            ));
      },
    );
  }
}
