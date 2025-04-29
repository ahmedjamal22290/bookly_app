import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this._homeRepo) : super(FeaturedBooksInitialState());
  final HomeRepo _homeRepo;
  Future<void> fetchFeaturedBoooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await _homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailureState(errMessage: failure.errorMessage));
    }, (books) {
      emit(FeaturedBooksSuccessState(books: books));
    });
  }
}
