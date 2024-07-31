import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mts/core/utils/initial_values.dart';

import '../../core/constants/api.dart';
import '../../core/error/failure.dart';
import '../../core/services/dio/dio_services.dart';
import '../model/global_response.dart';
import '../model/profile_model/user_data_model.dart';

abstract class ProfileRepository {
  Future<Either<FailureHandler, GlobalResponseModel>> updateUesrImage(
      {String imagePath});

  Future<Either<FailureHandler, UserDataModel>> getUserDate();
}

class ProfileImple implements ProfileRepository {
  @override
  Future<Either<FailureHandler, GlobalResponseModel>> updateUesrImage(
      {String? imagePath}) async {
    try {
      final response = await DioServices.post(
        url: Api.updateUserImage,
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
        data: FormData.fromMap({
          "personal_photo": await MultipartFile.fromFile(
            imagePath.toString(),
            filename: imagePath,
          ),
        }),
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
  Future<Either<FailureHandler, UserDataModel>> getUserDate() async {
    try {
      final response = await DioServices.get(
        url: Api.getUserData,
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
      );

      return Right(UserDataModel.fromJson(response.data));
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
