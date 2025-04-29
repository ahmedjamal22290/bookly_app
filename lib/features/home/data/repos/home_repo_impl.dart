import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      Map<String, dynamic> jsonData = await apiService.get(
          endPoints:
              'volumes?Filtering=free-ebooks&sorting=newest&q=subject:global');
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

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      Map<String, dynamic> jsonData = await ApiService(Dio())
          .get(endPoints: 'volumes?Filtering=free-ebooks&q=subject:public');
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
