import 'package:bookly_app/core/widgets/custom_error_text.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksFailureState) {
          return CustomErrorText(errorMessage: state.errMessage);
        } else if (state is FeaturedBooksSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3.625,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return FeaturedListViewItem(
                      bookModel: state.books[index],
                    );
                  }),
            ),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
