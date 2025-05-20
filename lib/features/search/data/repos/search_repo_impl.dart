import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<BookModel>>> fetchBooksByName(
      String name) async {
    try {
      Map<String, dynamic> jsonData =
          await apiService.get(endPoints: 'volumes?q=$name');
      List<BookModel> items = [];
      for (var element in jsonData['items']) {
        items.add(BookModel.fromJson(element));
      }
      return Right(items);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchBooksByCategory(
      String category) async {
    try {
      Map<String, dynamic> jsonData;
      jsonData =
          await apiService.get(endPoints: 'volumes?q=subject::$category');
      List<BookModel> items = [];
      for (var element in jsonData['items']) {
        items.add(BookModel.fromJson(element));
      }
      return right(items);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
