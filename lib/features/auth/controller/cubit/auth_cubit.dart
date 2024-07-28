import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mts/core/services/local_storage/local_storage.dart';

import '../../../../model/model/auth_model/register_param.dart';
import '../../../../model/repo_pattern/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  AuthRepository authRepository;

  RegisterParamModel? registerParamModel;

  register() async {
    emit(LoadingAuth());
    final result = await authRepository.register(model: registerParamModel!);

    result.fold(
      (l) {
        emit(FailureAuth());
      },
      (r) {
        SecureLocalStorage.set(
          key: SecureLocalStorage.userRegistrationKey,
          value: "true",
        );
        emit(SuccessAuth());
      },
    );
  }

  resetValues() {
    registerParamModel = null;
    emit(AuthInitial());
  }
}
