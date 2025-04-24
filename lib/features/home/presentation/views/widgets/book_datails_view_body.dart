import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_action_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/sugession_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/top_image_book_details.dart';

import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
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
            )),
            const BooksButtonAction(),
            Expanded(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0603)),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 30, bottom: 16),
              child: Text(
                'You can also like',
                textAlign: TextAlign.left,
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SugessionListView(),
          ],
        ),
      )
    ]);
  }
}
