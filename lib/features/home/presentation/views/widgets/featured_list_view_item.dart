import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({
    super.key,
    required this.bookModel,
    required this.selected,
  });
  final BookModel bookModel;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsViewPath);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 14),
        height: selected ? 224 : 193.3,
        child: Transform.scale(
          scale: selected ? 1 : 0.9,
          child: AspectRatio(
            aspectRatio: selected ? 150 / 224 : 129.21 / 193.3,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(bookModel
                          .volumeInfo!.imageLinks?.thumbnail ??
                      "https://toppng.com/uploads/thumbnail/erreur-404-11550708744ghwqbirawf.png"),
                ),
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
