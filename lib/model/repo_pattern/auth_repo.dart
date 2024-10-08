import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/constants/api.dart';
import '../../core/error/failure.dart';
import '../../core/services/dio/dio_services.dart';
import '../../core/utils/initial_values.dart';
import '../model/auth_model/login_response.dart';
import '../model/auth_model/register_param.dart';
import '../model/auth_model/upload_doc_param_model.dart';
import '../model/global_response.dart';

abstract class AuthRepository {
  Future<Either<FailureHandler, GlobalResponseModel>> register(
      {AuthParamModel model});

  Future<Either<FailureHandler, LoginResponseModel>> login(
      {AuthParamModel model});

  Future<Either<FailureHandler, GlobalResponseModel>> uploadDocument(
      {UploadDocParamModel model});

  Future<Either<FailureHandler, GlobalResponseModel>> logout();

  Future<Either<FailureHandler, GlobalResponseModel>> deleteAccount();

  Future<Either<FailureHandler, GlobalResponseModel>> changePassword({
    String? userid,
    String? email,
    String? oldPassword,
    String? newPassword,
    String? confirmNewPassword,
  });
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

  @override
  Future<Either<FailureHandler, GlobalResponseModel>> uploadDocument(
      {UploadDocParamModel? model}) async {
    log("######### ${InitialValues.userToken}");
    try {
      final response = await DioServices.put(
        url: Api.uploadDocument,
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
        data: FormData.fromMap({
          'license_image': model!.drivingLicenseImage == ""
              ? ""
              : await MultipartFile.fromFile(
                  model.drivingLicenseImage.toString(),
                  filename: model.drivingLicenseImage,
                ),
          'id_image': model.nationalIDImage == ""
              ? ""
              : await MultipartFile.fromFile(
                  model.nationalIDImage.toString(),
                  filename: model.nationalIDImage,
                ),
          'car_type': model.carType,
          'car_number': model.vehicleNumber,
          'license_number': model.licenseNumber,
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
  Future<Either<FailureHandler, GlobalResponseModel>> logout() async {
    log("######### ${InitialValues.userToken}");
    try {
      final response = await DioServices.post(
        url: Api.logout,
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
        data: FormData.fromMap(
            {'destroy': '1'}), // 1 =>  logout ,  2 => delete account
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
  Future<Either<FailureHandler, GlobalResponseModel>> deleteAccount() async {
    log("######### ${InitialValues.userToken}");
    try {
      final response = await DioServices.post(
        url: Api.logout,
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
        data: FormData.fromMap(
            {'destroy': '2'}), // 1 =>  logout ,  2 => delete account
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
  Future<Either<FailureHandler, GlobalResponseModel>> changePassword({
    String? userid,
    String? email,
    String? confirmNewPassword,
    String? oldPassword,
    String? newPassword,
  }) async {
    log("######### ${InitialValues.userToken}");
    try {
      final response = await DioServices.put(
        url: Api.updateUser(userid!),
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
        data: FormData.fromMap({
          "email":email,
          'old_password': oldPassword,
          'password': newPassword,
          'confirm_password': confirmNewPassword,
        }),
      );

      return Right(GlobalResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log("${e.response!.data}");

      return Left(
        FailureCase(
          message: e.response!.data["message"] ?? "Something is wrong",
          status: e.response!.data["status"] ?? false,
          failuresCases: e.response!.data["data"] ?? [],
        ),
      );
    }
  }
}
