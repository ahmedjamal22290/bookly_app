import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksButtonAction extends StatefulWidget {
  const BooksButtonAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BooksButtonAction> createState() => _BooksButtonActionState();
}

class _BooksButtonActionState extends State<BooksButtonAction> {
  bool isLoadingPreview = false;
  bool isLoadingBuy = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 37.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              if (widget.bookModel.saleInfo!.saleability == "FOR_SALE") {
                isLoadingBuy = true;
                setState(() {});
                Uri uri = Uri.parse(widget.bookModel.saleInfo!.buyLink ?? "");
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
                await Future.delayed(const Duration(seconds: 2));
                setState(() {
                  isLoadingBuy = false;
                });
              }
            },
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
                child: isLoadingBuy
                    ? SizedBox(
                        height:
                            MediaQuery.of(context).size.height * 0.05911 * 0.4,
                        child: const CircularProgressIndicator(
                          color: Colors.deepPurple,
                          strokeWidth: 2.5,
                        ),
                      )
                    : widget.bookModel.saleInfo!.saleability == "NOT_FOR_SALE"
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Free',
                                style: Styles.textStyle18.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              widget.bookModel.accessInfo?.pdf?.isAvailable ==
                                      false
                                  ? Container()
                                  : IconButton(
                                      icon: const Icon(Icons.download,
                                          color: Colors.black),
                                      onPressed: () async {
                                        Uri uri = Uri.parse(widget
                                                .bookModel
                                                .accessInfo
                                                ?.pdf
                                                ?.acsTokenLink ??
                                            "");
                                        if (await canLaunchUrl(uri)) {
                                          launchUrl(uri);
                                        }
                                      },
                                    ),
                            ],
                          )
                        : Text(
                            "${widget.bookModel.saleInfo!.amount!} EG",
                            style: Styles.textStyle18.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              isLoadingPreview = true;
              setState(() {});
              Uri uri =
                  Uri.parse(widget.bookModel.volumeInfo?.previewLink ?? "");
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
              await Future.delayed(const Duration(seconds: 2));
              isLoadingPreview = false;
              setState(() {});
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
                child: isLoadingPreview
                    ? SizedBox(
                        height:
                            MediaQuery.of(context).size.height * 0.05911 * 0.4,
                        child: const CircularProgressIndicator(
                          color: Colors.deepPurple,
                          strokeWidth: 2.5,
                        ),
                      )
                    : Text(
                        widget.bookModel.volumeInfo!.previewLink == null
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
