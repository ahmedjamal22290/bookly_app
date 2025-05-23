// ignore_for_file: file_names
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchViewAppBar extends StatelessWidget {
  const SearchViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              return context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            ),
          ),
          const Spacer(),
          Hero(
            tag: "BooklyLogo",
            child: Image.asset(
              AssetsData.logo,
              height: 35,
              width: 115,
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
