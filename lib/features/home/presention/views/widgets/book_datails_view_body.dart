import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presention/views/widgets/book_details_appbar.dart';
import 'package:bookly_app/features/home/presention/views/widgets/book_rating_widget.dart';
import 'package:bookly_app/features/home/presention/views/widgets/top_image_book_details.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BookDetailsAppBar(),
        const TopImageBookDetails(),
        const Padding(
          padding: EdgeInsets.only(bottom: 4.0, top: 43),
          child: Text(
            'The Jungle Book',
            style: Styles.textStyle30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
              color: const Color(0xffb7b6bc),
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const Center(
            child: BookRatingWidget(
          mainAxisAlignment: MainAxisAlignment.center,
        ))
      ],
    );
  }
}
