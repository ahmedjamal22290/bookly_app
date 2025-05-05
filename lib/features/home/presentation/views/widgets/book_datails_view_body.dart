import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_action_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/sugession_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/top_image_book_details.dart';

import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel? bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            const BookDetailsAppBar(),
            TopImageBookDetails(
              imageUrl: bookModel!.volumeInfo!.imageLinks!.thumbnail!,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 4.0, top: 43, right: 10, left: 10),
              child: Text(
                bookModel!.volumeInfo!.title!,
                textAlign: TextAlign.center,
                style: Styles.textStyle30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: Text(
                bookModel!.volumeInfo!.authors![0],
                style: Styles.textStyle18.copyWith(
                  color: const Color(0xffb7b6bc),
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Center(
                child: BookRatingWidget(
              mainAxisAlignment: MainAxisAlignment.center,
              volumeInfo: bookModel!.volumeInfo!,
            )),
            BooksButtonAction(
              bookModel: bookModel!,
            ),
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
