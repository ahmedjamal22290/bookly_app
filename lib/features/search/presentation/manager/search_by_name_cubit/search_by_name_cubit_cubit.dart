import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_by_name_cubit_state.dart';

class SearchByNameCubit extends Cubit<SearchByNameCubitState> {
  SearchByNameCubit(this._searchRepo) : super(SearchByNameCubitInitial());

  final SearchRepo _searchRepo;
  void fetchBooksByName(String name) async {
    emit(SearchByNameCubitLoading());
    var result = await _searchRepo.fetchBooksByName(name);
    result.fold((failures) {
      emit(SearchByNameCubitFailure(errorMessage: failures.errorMessage));
    }, (books) {
      emit(SearchByNameCubitSuccess(books: books));
    });
  }
}
