import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/constants/api.dart';
import '../../core/error/failure.dart';
import '../../core/services/dio/dio_services.dart';
import '../../core/utils/initial_values.dart';
import '../model/change_order_status_model.dart';
import '../model/global_response.dart';
import '../model/order_details.dart';
import '../model/order_model.dart';

abstract class OrderRepository {
  Future<Either<FailureHandler, OrderModel>> getOrders();

  Future<Either<FailureHandler, OrderById>> getDetailsById(id);

  Future<Either<FailureHandler, ChangeStatusModel>> changeOrderStatus({
    required String orderId,
    required String newStatus,
  });

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

  @override
  Future<Either<FailureHandler, OrderModel>> getOrders() async {
    try {
      final response = await DioServices.get(
        url: Api.getOrders,
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
      );

      return Right(OrderModel.fromJson(response.data));
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
  Future<Either<FailureHandler, OrderById>> getDetailsById(id) async {
    try {
      final response = await DioServices.get(
        url: Api.getOrdersById(id),
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
      );

      return Right(OrderById.fromJson(response.data));
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
  Future<Either<FailureHandler, ChangeStatusModel>> changeOrderStatus(
      {required String orderId, required String newStatus}) async {
    try {
      final response = await DioServices.post(
        url: Api.changeOrderStatus,
        headers: {
          'Authorization': "Bearer ${InitialValues.userToken}",
        },
        data: FormData.fromMap({
          'order_id': orderId,
          'order_status': newStatus,
        }),
        // 1 => order Pending
// 2 => order Processing
// 3 => order Out Of Delivery
// 4 => order Delivered
// 5 => order Return
      );

      return Right(ChangeStatusModel.fromJson(response.data));
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
