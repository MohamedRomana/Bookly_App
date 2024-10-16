import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');

      case DioExceptionType.unknown:
        return ServerFailure('Unknown Error with ApiServer');

      default:
        return ServerFailure('Unknown Error with ApiServer');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try later .');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try later .');
    } else {
      return ServerFailure('Something went wrong, please try later .');
    }
  }
}
