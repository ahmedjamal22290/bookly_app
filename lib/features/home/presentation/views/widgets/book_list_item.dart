import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_image_error.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kBookDetailsViewPath, extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 20),
        child: Row(
          children: [
            Hero(
              tag: bookModel.volumeInfo!.imageLinks!.thumbnail!,
              child: SizedBox(
                height: 105,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: AspectRatio(
                    aspectRatio: 70 / 105,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail!,
                      errorWidget: (context, url, error) {
                        return const CustomImageError();
                      },
                    ),
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
                        Hero(
                          tag:
                              "${bookModel.volumeInfo!.imageLinks!.thumbnail!}price",
                          child: Text(
                            bookModel.saleInfo!.saleability == "NOT_FOR_SALE"
                                ? 'Free'
                                : "${bookModel.saleInfo!.amount!} EG",
                            style: Styles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Hero(
                          tag:
                              "${bookModel.volumeInfo!.imageLinks!.thumbnail!}rating",
                          child: BookRatingWidget(
                            volumeInfo: bookModel.volumeInfo!,
                          ),
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
