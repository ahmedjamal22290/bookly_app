import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this._homeRepo) : super(NewestBooksInitialState());
  final HomeRepo _homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await _homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestBooksFailureState(errMessage: failure.errorMessage));
    }, (books) {
      emit(NewestBooksSuccessState(books: books));
    });
  }
}
