import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_appBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          SearchViewAppBar(),
        ],
      ),
    );
  }
}
