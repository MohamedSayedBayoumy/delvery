// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/services/local_storage/local_storage.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/initial_values.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../model/model/order_details.dart';
import '../../../../model/model/order_model.dart';
import '../../../../model/repo_pattern/order_repo.dart';
import '../../../auth/login/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({required this.orderRepository}) : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  OrderRepository orderRepository;

  String getCurrentUserStatus = "1";

  bool isOnlineUserStatus = false;

  OrderModel? orderModel;
  OrderById? orderById;

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
          emit(SuccessChangeUserStatus());
        } else {
          isOnlineUserStatus = true;
          await SecureLocalStorage.set(
            key: SecureLocalStorage.userStatusKey,
            value: "1",
          );
          InitialValues.userStatus = "1";
          Future.delayed(
            const Duration(seconds: 2),
            () {
              getOrders(context);
            },
          );
        }
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

  getUserStatus(context, {bool addNavigation = false}) {
    emit(LoadingOrderCase());

    if (InitialValues.userStatus == "1") {
      isOnlineUserStatus = true;
    } else {
      isOnlineUserStatus = false;
    }

    Future.delayed(
      const Duration(seconds: 2),
      () {
        getOrders(context, addNavigation: addNavigation);
      },
    );
  }

  getOrders(context, {bool addNavigation = false}) async {
    final result = await orderRepository.getOrders();

    result.fold(
      (l) {
        emit(FailureChangeUserStatus(message: l.message));
      },
      (r) {
        orderModel = r;
        checkUserHaveOrderInProcess(context, addNavigation: addNavigation);
      },
    );
  }

  changeOrderStatus(
    context, {
    required OrderProcess newStatusOrder,
    required String id,
  }) async {
    emit(LoadingOrderCase());
    String newStatusAsNumber = getCureentOrderStatus(newStatusOrder);

    final result = await orderRepository.changeOrderStatus(
      orderId: id,
      newStatus: newStatusAsNumber,
    );
    Navigator.pop(context);

    result.fold(
      (l) {
        Navigator.pop(context);

        emit(FailureChangeUserStatus(message: l.message));
      },
      (r) {
        if (newStatusOrder == OrderProcess.orderOutOfDelivery) {
          getOrdersDetails(context, id: id);
        } else {
          resetAll(context);
        }
      },
    );
  }

  getOrdersDetails(context, {required String id}) async {
    final result = await orderRepository.getDetailsById(id);

    result.fold(
      (l) {
        Navigator.pop(context);

        emit(FailureChangeUserStatus(message: l.message));
      },
      (r) async {
        orderById = r;

        await SecureLocalStorage.set(
          key: SecureLocalStorage.orderById,
          value: json.encode(r.toJson()),
        );

        emit(GetOrdersCase());
      },
    );
  }

  String getCureentOrderStatus(OrderProcess newStatusOrder) {
    String newStatusAsNumber = "";
    if (newStatusOrder == OrderProcess.orderOutOfDelivery) {
      newStatusAsNumber = "3";
    } else if (newStatusOrder == OrderProcess.orderDelivered) {
      newStatusAsNumber = "4";
    } else {
      newStatusAsNumber = "5";
    }
    return newStatusAsNumber;
  }

  bool isOrderDelevering(id) {
    if (orderById == null) {
      return false;
    } else {
      if (id == orderById!.data.itemNumber) {
        return true;
      } else {
        return false;
      }
    }
  }

  checkUserHaveOrderInProcess(context, {bool addNavigation = false}) async {
    final order = await SecureLocalStorage.get(SecureLocalStorage.orderById);

    if (order != "empty") {
      log("### User Have Order In Process");
      final orderConvert = json.decode(order);
      orderById = OrderById.fromJson(orderConvert);
      log("### Order is ${orderById!.data.itemNumber}");
    } else {
      log("### User Not Have Order");
    }
    if (addNavigation == true) {
      Navigator.pop(context);
    }

    emit(GetOrdersCase());
  }

  openMap(context, text) async {
    Clipboard.setData(new ClipboardData(text: text));

    final snackBar = SnackBar(
      content: Text(AppLocalizations.of(context)!.the_copied),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    final url =
        'https://www.google.com/maps/place/${orderById!.data.userLatitude},${orderById!.data.userLongitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  resetAll(context) async {
    await SecureLocalStorage.set(
      key: SecureLocalStorage.orderById,
      value: null,
    );
    orderById = null;
    getOrders(context);
    emit(GetOrdersCase());
  }
}
