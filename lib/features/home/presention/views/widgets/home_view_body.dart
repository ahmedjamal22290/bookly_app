import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presention/views/widgets/custom_appbar.dart';
import 'package:bookly_app/features/home/presention/views/widgets/featured_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          padding: EdgeInsets.only(left: 30.0, top: 49, bottom: 20),
          child: Text('Best Seller', style: Styles.textStyle18),
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
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.784 * 0.659,
                  child: const Text(
                    'Harry Potter and the Goblet of Fire',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.textStyle20,
                  ),
                ),
                Text(
                  'J.K. Rowling',
                  style: Styles.textStyle14.copyWith(
                    color: const Color(0xff707070),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '19.99 €',
                      style: Styles.textStyle20.copyWith(
                        fontFamily: '',
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.784 *
                          0.659 *
                          0.228,
                    ),
                    const SizedBox(
                      height: 12.8,
                      width: 13.38,
                      child: Icon(
                        FontAwesomeIcons.solidStar,
                        color: Color(0xffFFDD4F),
                        size: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.3, right: 9),
                      child: Text(
                        '4.8',
                        style: Styles.textStyle16.copyWith(color: Colors.white),
                      ),
                    ),
                    Text(
                      '(2390)',
                      style:
                          Styles.textStyle14.copyWith(color: Color(0xff707070)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
