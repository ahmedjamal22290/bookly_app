import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopImageBookDetails extends StatelessWidget {
  const TopImageBookDetails({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Hero(
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
    );
  }
}
