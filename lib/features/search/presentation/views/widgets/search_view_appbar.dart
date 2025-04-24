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
          Image.asset(
            'assets/images/Logo.png',
            height: 35,
            width: 115,
          ),
          const Spacer()
        ],
      ),
    );
  }
}
