import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SugessionListItem extends StatelessWidget {
  const SugessionListItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kBookDetailsViewPath, extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: SizedBox(
          height: 112,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 70 / 112,
              child: CachedNetworkImage(
                imageUrl: bookModel.volumeInfo!.imageLinks!.smallThumbnail!,
                fit: BoxFit.fill,
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
