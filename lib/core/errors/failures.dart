import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;
  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeiout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeiout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeiout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('There is connection error with ApiServer');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SoketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again later!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("your request not found");
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
