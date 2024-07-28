import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mts/core/services/local_storage/local_storage.dart';

import '../../../../model/model/auth_model/register_param.dart';
import '../../../../model/repo_pattern/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String countryCode = "+20";

  AuthRepository authRepository;

  register(context) async {
    emit(LoadingAuth());
    final result = await authRepository.register(
      model: AuthParamModel(
        email: emailController.text,
        name: fullNameController.text,
        password: passwordController.text,
        phoneNumber: "$countryCode${phoneController.text}",
        confirmPassword: confirmController.text,
      ),
    );
    Navigator.pop(context);

    result.fold(
      (l) {
        emit(FailureAuth(message: l.message));
      },
      (r) async {
        await SecureLocalStorage.set(
          key: SecureLocalStorage.userRegistrationKey,
          value: "false",
        );
        emit(SuccessAuth());
      },
    );
  }

  login(context) async {
    emit(LoadingAuth());
    final result = await authRepository.login(
      model: AuthParamModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    Navigator.pop(context);

    result.fold(
      (l) {
        emit(FailureAuth(message: l.message));
      },
      (r) async {
        await SecureLocalStorage.set(
          key: SecureLocalStorage.userTokenKey,
          value: r.data!.token,
        );
        emit(SuccessAuth());
      },
    );
  }

  uploadDocument(context) async {
    emit(LoadingAuth());
    final result = await authRepository.login(
      model: AuthParamModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    Navigator.pop(context);

    result.fold(
      (l) {
        emit(FailureAuth(message: l.message));
      },
      (r) {
        emit(SuccessAuth());
      },
    );
  }

  resetValues() {
    emit(AuthInitial());
  }

  bool showPassword = true;

  toggleShowPassword() {
    showPassword = !showPassword;
    emit(ShowPassword());
  }
}
