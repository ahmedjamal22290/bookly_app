import 'package:bookly_app/core/widgets/custom_error_text.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccessState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == state.books.length - 1) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0728);
                }
                return BookListItem(
                  bookModel: state.books[index],
                );
              },
              childCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksFailureState) {
          return SliverToBoxAdapter(
            child: CustomErrorText(errorMessage: state.errMessage),
          );
        } else {
          return const SliverToBoxAdapter(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
