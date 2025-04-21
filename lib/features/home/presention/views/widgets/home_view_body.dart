import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presention/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presention/views/widgets/custom_appbar.dart';
import 'package:bookly_app/features/home/presention/views/widgets/featured_book_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBookListView(),
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 49, bottom: 20),
                child: Text('Best Seller', style: Styles.textStyle18),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BestSellerListView(),
        )
      ],
    );
  }
}
