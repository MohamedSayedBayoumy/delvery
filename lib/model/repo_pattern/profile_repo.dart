import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/constants/api.dart';
import '../../core/error/failure.dart';
import '../../core/services/dio/dio_services.dart';
import '../../core/utils/initial_values.dart';
import '../model/global_response.dart';
import '../model/profile_model/balance_model.dart';
import '../model/profile_model/history_model.dart';
import '../model/profile_model/update_user_image.dart';
import '../model/profile_model/user_data_model.dart';

abstract class ProfileRepository {
  Future<Either<FailureHandler, GlobalResponseModel>> updateUesr(
      {ProfileParam data});

  Future<Either<FailureHandler, UserDataModel>> getUserDate();

  Future<Either<FailureHandler, HistoryModel>> historyDate(status);
  Future<Either<FailureHandler, TotalBalanceModel>> getTotalBalance();
}

class ProfileImple implements ProfileRepository {
  @override
  Future<Either<FailureHandler, GlobalResponseModel>> updateUesr(
      {ProfileParam? data}) async {
    try {
      final response = await DioServices.put(
        url: Api.updateUserImage(data!.userId),
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
        data: data.image.isEmpty
            ? FormData.fromMap(
                {
                  'name': data.name,
                  'email': data.email,
                },
              )
            : FormData.fromMap(
                {
                  'name': data.name,
                  'email': data.email,
                  'personal_photo': await MultipartFile.fromFile(
                    data.image,
                    filename: data.image,
                  ),
                },
              ),
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

  @override
  Future<Either<FailureHandler, HistoryModel>> historyDate(status) async {
    try {
      final response = await DioServices.get(
        url: Api.historyDate(status),
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
      );

      return Right(HistoryModel.fromJson(response.data));
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
  Future<Either<FailureHandler, TotalBalanceModel>> getTotalBalance() async {
   try {
      final response = await DioServices.get(
        url: Api.totalBalanceDate,
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
      );

      return Right(TotalBalanceModel.fromJson(response.data));
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
