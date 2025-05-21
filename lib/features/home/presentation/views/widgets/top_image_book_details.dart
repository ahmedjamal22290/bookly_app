import 'package:bookly_app/features/home/presentation/views/widgets/favorite_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopImageBookDetails extends StatelessWidget {
  const TopImageBookDetails(
      {super.key,
      required this.imageUrl,
      required this.onFavToggle,
      required this.onNotFavToggle,
      required this.id});
  final String imageUrl;
  final void Function() onFavToggle;
  final void Function() onNotFavToggle;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: imageUrl,
          child: SizedBox(
            height: 243,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: AspectRatio(
                aspectRatio: 162 / 243,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
          ),
        ),
        FavoriteButton(
          id: id,
          onFavToggle: onFavToggle,
          onNotFavToggle: onNotFavToggle,
        )
      ],
    );
  }
}
