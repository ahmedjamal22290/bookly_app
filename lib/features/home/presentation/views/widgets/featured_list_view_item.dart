import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: AspectRatio(
              aspectRatio: selected ? 150 / 224 : 129.21 / 193.3,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail!,
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error_outline);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
