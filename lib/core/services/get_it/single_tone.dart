import 'package:get_it/get_it.dart';

import '../../../model/repo_pattern/auth_repo.dart';
import '../dio/dio_services.dart';

final sl = GetIt.asNewInstance();

class ServicesLocator {
  ServicesLocator();

  static void service() {

    sl.registerFactory<DioServices>(() => DioServices());
    sl.registerFactory<AuthRepository>(() => AuthImple());
  }
}
