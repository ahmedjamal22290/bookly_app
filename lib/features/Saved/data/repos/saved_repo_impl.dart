import 'package:bookly_app/features/Saved/data/repos/saved_repo.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

class SavedRepoImpl implements SavedRepo {
  List<BookModel> savedBooks = [];
  @override
  void addNewItem(BookModel bookModel) {
    savedBooks.add(bookModel);
  }

  @override
  void deleteItem(BookModel bookModel) {
    savedBooks.remove(bookModel);
  }

  @override
  List<BookModel> getSavedBoooks() {
    return savedBooks;
  }
}
