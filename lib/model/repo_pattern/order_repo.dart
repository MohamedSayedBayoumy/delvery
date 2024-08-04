import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mts/core/utils/initial_values.dart';

import '../../core/constants/api.dart';
import '../../core/error/failure.dart';
import '../../core/services/dio/dio_services.dart';
import '../model/global_response.dart';

abstract class OrderRepository {
  Future<Either<FailureHandler, GlobalResponseModel>> changeUserStatus(
      {String newStatus});
}

class OrderImple implements OrderRepository {
  @override
  Future<Either<FailureHandler, GlobalResponseModel>> changeUserStatus(
      {String? newStatus}) async {
    try {
      log("New Status is $newStatus");

      final response = await DioServices.put(
        url: Api.updateUserStatus,
        data: FormData.fromMap(
          {'online_status': newStatus}, // 1 => Online    // 2 => Offline
        ),
        headers: {
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
