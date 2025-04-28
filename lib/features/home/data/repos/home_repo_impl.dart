import 'dart:developer';

import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

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
        // log(items[0].toString());
      }
      log(items[0].toString());
      return right(items);
    } on Exception catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
