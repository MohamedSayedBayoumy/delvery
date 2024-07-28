import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/constants/api.dart';
import '../../core/error/failure.dart';
import '../../core/services/dio/dio_services.dart';
import '../model/auth_model/login_response.dart';
import '../model/auth_model/register_param.dart';
import '../model/global_response.dart';

abstract class AuthRepository {
  Future<Either<FailureHandler, GlobalResponseModel>> register(
      {AuthParamModel model});

  Future<Either<FailureHandler, LoginResponseModel>> login(
      {AuthParamModel model});

  // Future<Either<FailureHandler, LoginResponseModel>> uploadDocument(
  //     {AuthParamModel model});
}

class AuthImple implements AuthRepository {
  @override
  Future<Either<FailureHandler, GlobalResponseModel>> register(
      {AuthParamModel? model}) async {
    try {
      final response = await DioServices.post(
        url: Api.register,
        data: FormData.fromMap(model!.registerToJson()),
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

  @override
  Future<Either<FailureHandler, LoginResponseModel>> login(
      {AuthParamModel? model}) async {
    try {
      final response = await DioServices.post(
        url: Api.login,
        data: FormData.fromMap(model!.loginToJson()),
      );

      return Right(LoginResponseModel.fromJson(response.data));
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

  // @override
  // Future<Either<FailureHandler, LoginResponseModel>> uploadDocument(
  //     {AuthParamModel model}) {
  //   // TODO: implement uploadDocument
  //   throw UnimplementedError();
  // }
}
