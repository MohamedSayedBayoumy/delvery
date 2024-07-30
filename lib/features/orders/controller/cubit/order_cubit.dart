
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_storage/local_storage.dart';
import '../../../../core/utils/initial_values.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../model/repo_pattern/order_repo.dart';
import '../../../auth/login/login_screen.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({required this.orderRepository}) : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  OrderRepository orderRepository;

  String getCurrentUserStatus = "1";

  bool isOnlineUserStatus = false;

  changeUserStatus(context) async {
    emit(LoadingOrderCase());

    final newUserStatus = InitialValues.userStatus == "1" ? "2" : "1";

    final result = await orderRepository.changeUserStatus(
      newStatus: newUserStatus,
    );
    Navigator.pop(context);

    result.fold(
      (l) {
        emit(FailureChangeUserStatus(message: l.message));
      },
      (r) async {
        // 1 online
        // 2 offline
        if (InitialValues.userStatus == "1") {
          isOnlineUserStatus = false;
          await SecureLocalStorage.set(
            key: SecureLocalStorage.userStatusKey,
            value: "2",
          );
          InitialValues.userStatus = "2";
        } else {
          isOnlineUserStatus = true;
          await SecureLocalStorage.set(
            key: SecureLocalStorage.userStatusKey,
            value: "1",
          );
          InitialValues.userStatus = "1";
        }
        emit(SuccessChangeUserStatus());
      },
    );
  }

  checkSecuryUserStatus(context) async {
    emit(LoadingOrderCase());

    getCurrentUserStatus =
        await SecureLocalStorage.get(SecureLocalStorage.userStatusKey);
    if (getCurrentUserStatus == "empty") {
      NavigationHelper.navigateRemoveUntilTo(context, const LoginScreen());
    } else {
      emit(OrderInitial());
    }
  }

  getUserStatus() {
    emit(LoadingOrderCase());

    if (InitialValues.userStatus == "1") {
      isOnlineUserStatus = true;
    } else {
      isOnlineUserStatus = false;
    }
    emit(GetUserStatus());
  }
}
