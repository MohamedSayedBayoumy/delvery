import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/constants/api.dart';
import '../../core/error/failure.dart';
import '../../core/services/dio/dio_services.dart';
import '../../core/utils/initial_values.dart';
import '../model/global_response.dart';

abstract class NoirifcationRepository {
  Future<Either<FailureHandler, GlobalResponseModel>> getNotification(
      {int pageNumber});
}

class NoirifcationImple implements NoirifcationRepository {
  @override
  Future<Either<FailureHandler, GlobalResponseModel>> getNotification(
      {int? pageNumber}) async {
    log("######### ${InitialValues.userToken}");
    try {
      final response = await DioServices.put(
        url: Api.getNotification(pageNumber!),
        headers: {
          'Accept-Language': 'en',
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
      );

      return Right(GlobalResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log("${e.response!.data}");

      return Left(
        FailureCase(
          message: e.response!.data["message"] ?? "Something is wrong",
          status: e.response!.data["status"],
          failuresCases: e.response!.data["data"] ?? [],
        ),
      );
    }
  }
}
