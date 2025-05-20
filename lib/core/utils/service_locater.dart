import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiService: ApiService(
        Dio(),
      ),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(apiService: ApiService(Dio())));
}
