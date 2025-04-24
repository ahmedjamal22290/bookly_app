import 'package:bookly_app/features/home/presentation/views/widgets/book_list_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 15,
      itemBuilder: (context, index) {
        return const BookListItem();
      },
    );
  }
}
