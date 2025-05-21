import 'package:bookly_app/features/Saved/data/repos/saved_repo.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_books_state.dart';

class SavedBooksCubit extends Cubit<SavedBooksState> {
  SavedBooksCubit(this._savedRepo)
      : super(_savedRepo.getSavedBooks().isEmpty
            ? SavedBooksEmpty()
            : SavedBooksInitial());
  final SavedRepo _savedRepo;
  void addNewSavedBook(BookModel bookModel) {
    _savedRepo.addNewItem(bookModel);
    emit(SavedBooksUpdate(books: _savedRepo.getSavedBooks()));
  }

  void deleteSavedBook(BookModel bookModel) {
    _savedRepo.deleteItem(bookModel);
    emit(SavedBooksUpdate(books: _savedRepo.getSavedBooks()));
  }

  List<BookModel> getSavedBooks() {
    List<BookModel> list = _savedRepo.getSavedBooks();

    emit(list.isEmpty ? SavedBooksEmpty() : SavedBooksSuccess(books: list));
    return list;
  }
}
