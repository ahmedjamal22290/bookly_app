import 'package:bookly_app/features/home/presentation/views/widgets/sugession_list_item.dart';
import 'package:flutter/material.dart';

class SugessionListView extends StatelessWidget {
  const SugessionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1379,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 30, bottom: 40),
      child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const SugessionListItem();
          }),
    );
  }
}
