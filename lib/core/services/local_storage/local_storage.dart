import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureLocalStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static String userCompeleteRequriedData = "userCompeleteRequriedData";

  static String userTokenKey = "userTokenKey";

  static String userStatusKey = "userStatusKey";

  static String orderById = "orderById";

  static String langeKey = "langeKey";

  static Future<void> set({String? key, String? value}) async {
    await storage.write(key: key!, value: value);
  }

  static Future<String> get(String key) async {
    String value = await storage.read(key: key) ?? 'empty';
    return value;
  }

  static disposeData(String key) async {
    await storage.delete(key: key);
  }

  static disposeAll() async {
    await storage.deleteAll();
  }
}
