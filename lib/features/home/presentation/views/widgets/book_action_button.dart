import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksButtonAction extends StatelessWidget {
  const BooksButtonAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 37.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05911,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  bookModel.saleInfo!.saleability == "NOT_FOR_SALE"
                      ? 'Free'
                      : "${bookModel.saleInfo!.amount!} EG",
                  style: Styles.textStyle18.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Uri uri = Uri.parse(bookModel.volumeInfo?.previewLink ?? "");
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05911,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: const BoxDecoration(
                color: Color(0xffEF8262),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  bookModel.volumeInfo!.previewLink == null
                      ? "There is no Preview"
                      : 'Free preview',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
