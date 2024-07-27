import 'package:get_it/get_it.dart';

import '../dio/dio_services.dart';
import '../local_storage/local_storage.dart';

final sl = GetIt.asNewInstance();

class ServicesLocator {
  ServicesLocator();

  static void service() {
    sl.registerFactory<SecureLocalStorage>(() => SecureLocalStorage());

    sl.registerFactory<DioServices>(() => DioServices());
  }
}
