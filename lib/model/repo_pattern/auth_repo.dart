import 'package:dartz/dartz.dart';

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
      final response = await DioServices.post(url: Api.register);

      return Right(GlobalResponseModel.fromJson(response.data));
    } catch (e) {
      return Left(FailureCase(message: e.toString(), status: "false"));
    }
  }
}
