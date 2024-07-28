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

  register() async {
    emit(LoadingAuth());
    final result = await authRepository.register(
      model: RegisterParamModel(
        email: emailController.text,
        name: fullNameController.text,
        password: passwordController.text,
        phoneNumber: "$countryCode${phoneController.text}",
        confirmPassword: confirmController.text,
      ),
    );

    result.fold(
      (l) {
        emit(FailureAuth(message: l.message));
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

  bool isChecked = false;

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.white;
  }

  resetValues() {
    emit(AuthInitial());
  }
}
