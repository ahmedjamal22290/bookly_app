import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_by_name_cubit_state.dart';

class SearchByNameCubitCubit extends Cubit<SearchByNameCubitState> {
  SearchByNameCubitCubit(this._searchRepo) : super(SearchByNameCubitLoading());

  final SearchRepo _searchRepo;
  void fetchBooksByName(String name) async {
    var result = await _searchRepo.fetchBooksByName(name);
    result.fold((failures) {
      emit(SearchByNameCubitFailure(errorMessage: failures.errorMessage));
    }, (books) {
      emit(SearchByNameCubitSuccess(books: books));
    });
  }
}
