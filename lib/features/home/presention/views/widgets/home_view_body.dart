import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presention/views/widgets/custom_appbar.dart';
import 'package:bookly_app/features/home/presention/views/widgets/featured_book_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        FeaturedBookListView(),
        Padding(
          padding: EdgeInsets.only(left: 30.0, top: 49),
          child: Text('Best Seller', style: Styles.titleMedium),
        ),
        BestSellerItem(),
      ],
    );
  }
}

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                child: Image.asset(
                  'assets/images/tset_image.png',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Harry Potter and the Goblet of Fire',
                  textWidthBasis: TextWidthBasis.parent,
                  style: Styles.bestSellerTitle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
