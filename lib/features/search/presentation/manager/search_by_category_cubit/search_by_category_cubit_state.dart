part of 'search_by_category_cubit_cubit.dart';

abstract class SearchByCategoryCubitState {
  const SearchByCategoryCubitState();
}

final class SearchByCategoryCubitInitial extends SearchByCategoryCubitState {}

final class SearchByCategoryCubitLoading extends SearchByCategoryCubitState {}

final class SearchByCategoryCubitFailure extends SearchByCategoryCubitState {
  final String errorMessage;

  SearchByCategoryCubitFailure({required this.errorMessage});
}

final class SearchByCategoryCubitSuccess extends SearchByCategoryCubitState {
  final List<BookModel> books;

  SearchByCategoryCubitSuccess({required this.books});
}
