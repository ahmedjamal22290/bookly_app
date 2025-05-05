import 'package:bookly_app/core/widgets/custom_error_text.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/sugession_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SugessionListView extends StatelessWidget {
  const SugessionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccessState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.1379,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30, bottom: 40),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SugessionListItem(
                    bookModel: state.items[index],
                  );
                }),
          );
        } else if (state is SimilarBooksFailureState) {
          return CustomErrorText(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
