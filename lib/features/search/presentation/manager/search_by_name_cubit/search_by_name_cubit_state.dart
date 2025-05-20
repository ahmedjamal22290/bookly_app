part of 'search_by_name_cubit_cubit.dart';

abstract class SearchByNameCubitState {
  const SearchByNameCubitState();
}

final class SearchByNameCubitInitial extends SearchByNameCubitState {}

final class SearchByNameCubitLoading extends SearchByNameCubitState {}

final class SearchByNameCubitFailure extends SearchByNameCubitState {
  final String errorMessage;

  const SearchByNameCubitFailure({required this.errorMessage});
}

final class SearchByNameCubitSuccess extends SearchByNameCubitState {
  final List<BookModel> books;

  const SearchByNameCubitSuccess({required this.books});
}
