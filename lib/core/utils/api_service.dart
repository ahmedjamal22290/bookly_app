import 'package:dio/dio.dart';

class ApiService {
  ApiService(this.dio);
  final _baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio dio;
  Future<Map<String, dynamic>> get({required String endPoints}) async {
    Response response = await dio.get("$_baseUrl$endPoints");
    Map<String, dynamic> jsonData = response.data;
    return jsonData;
  }
}
