import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}
