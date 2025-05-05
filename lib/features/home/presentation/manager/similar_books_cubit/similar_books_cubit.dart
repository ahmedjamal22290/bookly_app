import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this._homeRepo) : super(SimilarBooksInitialState());
  final HomeRepo _homeRepo;

  void fetchSimilarBooks(String category) async {
    emit(SimilarBooksLoadingState());
    var result = await _homeRepo.fetchSimilarBooks(category);
    result.fold((failures) {
      emit(SimilarBooksFailureState(errorMessage: failures.errorMessage));
    }, (items) {
      emit(SimilarBooksSuccessState(items: items));
    });
  }
}
