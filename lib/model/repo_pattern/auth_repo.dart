import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/constants/api.dart';
import '../../core/error/failure.dart';
import '../../core/services/dio/dio_services.dart';
import '../model/auth_model/register_param.dart';
import '../model/global_response.dart';

abstract class AuthRepository {
  Future<Either<FailureHandler, GlobalResponseModel>> register(
      {RegisterParamModel model});
}

class AuthImple implements AuthRepository {
  @override
  Future<Either<FailureHandler, GlobalResponseModel>> register(
      {RegisterParamModel? model}) async {
    try {
      final response = await DioServices.post(
        url: Api.register,
        data: FormData.fromMap(model!.toJson()),
      );

      return Right(GlobalResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log(" ccc ${e.response!.data}");

      return Left(FailureCase(
        message: e.response!.data["message"],
        status: e.response!.data["status"],
      ));
    }
  }
}
