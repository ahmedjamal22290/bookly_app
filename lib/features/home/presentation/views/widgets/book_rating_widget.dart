import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/volume_info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRatingWidget extends StatelessWidget {
  const BookRatingWidget({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.volumeInfo,
  });
  final MainAxisAlignment mainAxisAlignment;
  final VolumeInfo volumeInfo;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 18,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.3, right: 9),
          child: Text(
            volumeInfo.averageRating == null ||
                    volumeInfo.averageRating == 'null'
                ? 'oo'
                : volumeInfo.averageRating!,
            style: Styles.textStyle16.copyWith(color: Colors.white),
          ),
        ),
        Text(
          '(${volumeInfo.pageCount.toString()})',
          style: Styles.textStyle14.copyWith(
            color: const Color(0xff888590),
          ),
        ),
      ],
    );
  }
}
