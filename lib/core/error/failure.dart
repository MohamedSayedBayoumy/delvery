import 'package:dio/dio.dart';

abstract class FailureHandler {
  final String message;
  final bool status;
  final List<dynamic> failuresCases;

  FailureHandler(
      {required this.message,
      required this.status,
      this.failuresCases = const []});
}

class FailureCase extends FailureHandler {
  FailureCase({
    required super.message,
    required super.status,
    required super.failuresCases,
  });
}

class HandleInternetConnectionError extends FailureHandler {
  HandleInternetConnectionError(
      {required super.message,
      required super.status,
      required super.failuresCases});

  factory HandleInternetConnectionError.fromDioExceptionType(
      {DioExceptionType? dioError, FailureHandler? model}) {
    switch (dioError) {
      case DioExceptionType.badCertificate:
        return HandleInternetConnectionError(
          message: model!.message,
          status: model.status,
          failuresCases: model.failuresCases,
        );
      case DioExceptionType.connectionError:
        return HandleInternetConnectionError(
          message: model!.message,
          status: model.status,
          failuresCases: model.failuresCases,
        );
      case DioExceptionType.connectionTimeout:
        return HandleInternetConnectionError(
          message: model!.message,
          status: model.status,
          failuresCases: model.failuresCases,
        );
      case DioExceptionType.sendTimeout:
        return HandleInternetConnectionError(
          message: model!.message,
          status: model.status,
          failuresCases: model.failuresCases,
        );
      case DioExceptionType.receiveTimeout:
        return HandleInternetConnectionError(
          message: model!.message,
          status: model.status,
          failuresCases: model.failuresCases,
        );
      case DioExceptionType.cancel:
        return HandleInternetConnectionError(
          message: model!.message,
          status: model.status,
          failuresCases: model.failuresCases,
        );
      case DioExceptionType.badResponse:
        return HandleInternetConnectionError(
          message: model!.message,
          status: model.status,
          failuresCases: model.failuresCases,
        );
      case DioExceptionType.unknown:
        return HandleInternetConnectionError(
          message: model!.message,
          status: model.status,
          failuresCases: model.failuresCases,
        );

      // return HandleInternetConnectionError(
      //     "Check your Internet connection and try again");

      default:
        return HandleInternetConnectionError(
          message: "Some thing is wrong , please try again later",
          status: false,
          failuresCases: [],
        );
    }
  }
}
