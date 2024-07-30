import 'dart:developer';

import '../services/local_storage/local_storage.dart';

class InitialValues {
  static String userToken = "";

  static String userStatus = "";

  static init() async {
    userToken = await SecureLocalStorage.get(SecureLocalStorage.userTokenKey);

    userStatus = await SecureLocalStorage.get(SecureLocalStorage.userStatusKey);
    if (userStatus == "empty") {
      log("user status is Empty");
      await SecureLocalStorage.set(
        key: SecureLocalStorage.userStatusKey,
        value: "2",
      );
    }
    log("user token : ${InitialValues.userToken}");
    log("user status : $userStatus");
  }
}
