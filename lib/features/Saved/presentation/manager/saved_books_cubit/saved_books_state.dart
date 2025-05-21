part of 'saved_books_cubit.dart';

abstract class SavedBooksState {
  const SavedBooksState();
}

final class SavedBooksInitial extends SavedBooksState {}

final class SavedBooksUpdate extends SavedBooksState {}

final class SavedBooksEmpty extends SavedBooksState {}

final class SavedBooksSuccess extends SavedBooksState {
  final List<BookModel> books;

  SavedBooksSuccess({required this.books});
}
