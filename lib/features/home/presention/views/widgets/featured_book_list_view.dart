import 'package:bookly_app/features/home/presention/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3.625,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const FeaturedListViewItem();
            }),
      ),
    );
  }
}
