import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/Saved/presentation/manager/saved_books_cubit/saved_books_cubit.dart';
import 'package:bookly_app/features/Saved/presentation/views/widgets/saved_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedViewBody extends StatelessWidget {
  const SavedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 18, bottom: 30),
              width: MediaQuery.of(context).size.width,
              child: const Text(
                'Here is your Favorite books',
                textAlign: TextAlign.start,
                style: Styles.textStyle20,
              ),
            ),
            Expanded(
              child: BlocBuilder<SavedBooksCubit, SavedBooksState>(
                builder: (context, state) {
                  if (state is SavedBooksSuccess) {
                    return ListView.builder(
                      itemCount: state.books.length,
                      itemBuilder: (context, index) {
                        return BookListItem(bookModel: state.books[index]);
                      },
                    );
                  } else if (state is SavedBooksUpdate) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.books.length + 1,
                      itemBuilder: (context, index) {
                        if (index == state.books.length) {
                          return const SizedBox(height: 80);
                        }
                        return BookSavedItem(bookModel: state.books[index]);
                      },
                    );
                  } else if (state is SavedBooksEmpty) {
                    return const Center(child: Text('There is no Fav books'));
                  } else {
                    return const Text('...');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
