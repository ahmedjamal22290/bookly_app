part of 'newest_books_cubit.dart';

abstract class NewestBooksState {}

final class NewestBooksInitialState extends NewestBooksState {}

final class NewestBooksLoadingState extends NewestBooksState {}

final class NewestBooksFailureState extends NewestBooksState {
  final String errMessage;

  NewestBooksFailureState({required this.errMessage});
}

final class NewestBooksSucessState extends NewestBooksState {
  final List<BookModel> books;

  NewestBooksSucessState({required this.books});
}
