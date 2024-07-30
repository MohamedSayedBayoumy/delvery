import 'package:get_it/get_it.dart';

import '../../../features/auth/controller/cubit/auth_cubit.dart';
import '../../../features/orders/controller/cubit/order_cubit.dart';
import '../../../features/profile/controller/cubit/profile_cubit.dart';
import '../../../model/repo_pattern/auth_repo.dart';
import '../../../model/repo_pattern/order_repo.dart';
import '../../../model/repo_pattern/profile_repo.dart';
import '../dio/dio_services.dart';

final sl = GetIt.asNewInstance();

class ServicesLocator {
  ServicesLocator();

  static void service() {
    sl.registerFactory<DioServices>(() => DioServices());

    // repository pattern
    sl.registerFactory<AuthRepository>(() => AuthImple());
    sl.registerFactory<ProfileRepository>(() => ProfileImple());
    sl.registerFactory<OrderRepository>(() => OrderImple());

    // cubits
    sl.registerFactory<AuthCubit>(() => AuthCubit(authRepository: sl()));
    sl.registerFactory<ProfileCubit>(() => ProfileCubit(authRepository: sl()));
    sl.registerFactory<OrderCubit>(() => OrderCubit(orderRepository: sl()));
  }
}
