import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsViewPath);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 20),
        child: Row(
          children: [
            SizedBox(
              height: 105,
              child: AspectRatio(
                aspectRatio: 70 / 105,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(
                    bookModel.volumeInfo!.imageLinks?.smallThumbnail ??
                        "https://toppng.com/uploads/thumbnail/erreur-404-11550708744ghwqbirawf.png",
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.784 * 0.659,
                      child: Text(
                        bookModel.volumeInfo!.title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Styles.textStyle20.copyWith(
                          fontFamily: kGtSectra,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        bookModel.volumeInfo?.authors?[0] ?? 'none',
                        style: Styles.textStyle14.copyWith(
                          color: const Color(0xffb7b6bc),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          bookModel.saleInfo!.saleability == "NOT_FOR_SALE"
                              ? '0.0'
                              : "${bookModel.saleInfo!.amount!} EG",
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        BookRatingWidget(
                          volumeInfo: bookModel.volumeInfo!,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
