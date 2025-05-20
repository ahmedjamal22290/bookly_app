import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_by_category_cubit_state.dart';

class SearchByCategoryCubitCubit extends Cubit<SearchByCategoryCubitState> {
  SearchByCategoryCubitCubit(this._searchRepo)
      : super(SearchByCategoryCubitInitial());
  final SearchRepo _searchRepo;
  void searchByCategory(String category) async {
    emit(SearchByCategoryCubitLoading());
    var result = await _searchRepo.fetchBooksByCategory(category);
    result.fold((failure) {
      emit(SearchByCategoryCubitFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(SearchByCategoryCubitSuccess(books: books));
    });
  }
}
