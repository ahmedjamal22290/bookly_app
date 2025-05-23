import 'package:bookly_app/features/Saved/presentation/manager/saved_books_cubit/saved_books_cubit.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.onFavToggle,
    required this.onNotFavToggle,
    required this.id,
  });
  final void Function() onFavToggle;
  final void Function() onNotFavToggle;
  final String id;
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _sizeAnimation;

  late bool fav;
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    List<BookModel> list =
        BlocProvider.of<SavedBooksCubit>(context).getSavedBooks();
    fav = list.any((b) {
      return b.id == widget.id;
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
                if (fav) {
                  widget.onFavToggle.call();
                } else {
                  widget.onNotFavToggle.call();
                }
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
