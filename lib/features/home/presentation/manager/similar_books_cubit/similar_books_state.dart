part of 'similar_books_cubit.dart';

abstract class SimilarBooksState {}

final class SimilarBooksInitialState extends SimilarBooksState {}

final class SimilarBooksLoadingState extends SimilarBooksState {}

final class SimilarBooksFailureState extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksFailureState({required this.errorMessage});
}

final class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookModel> items;

  SimilarBooksSuccessState({required this.items});
}
