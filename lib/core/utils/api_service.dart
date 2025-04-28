import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);
  final _baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;
  Future<Map<String, dynamic>> get({required String endPoints}) async {
    Response response = await _dio.get("$_baseUrl$endPoints");
    Map<String, dynamic> jsonData = response.data;
    return jsonData;
  }
}
