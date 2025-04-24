import 'package:bookly_app/features/home/presentation/views/widgets/book_list_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});
  final length = 9;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == length - 1) {
          return SizedBox(height: MediaQuery.of(context).size.height * 0.0728);
        }
        return const BookListItem();
      }, childCount: length),
    );
  }
}
