import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class SavedRepo {
  void addNewItem(BookModel bookModel);
  void deleteItem(BookModel bookModel);
  List<BookModel> getSavedBoooks();
}
