import 'package:bookly_app/features/home/presention/views/widgets/book_details_appbar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [BookDetailsAppBar()],
    );
  }
}
