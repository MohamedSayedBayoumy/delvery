import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_storage/local_storage.dart';
import '../../../../core/utils/initial_values.dart';
import '../../../../model/model/auth_model/register_param.dart';
import '../../../../model/model/auth_model/upload_doc_param_model.dart';
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
        if (l.failuresCases.isNotEmpty) {
          emit(
            FailureAuth(
                message: l.failuresCases.map((e) => e.values.first).join('\n')),
          );
        } else {
          emit(FailureAuth(message: l.message));
        }
      },
      (r) async {
        emit(SuccessAuth());
        resetValues();
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
        if (l.failuresCases.isNotEmpty) {
          emit(FailureAuth(
              message: l.failuresCases.map((e) => e.values.first).join(', ')));
        } else {
          emit(FailureAuth(message: l.message));
        }
      },
      (r) async {
        InitialValues.userToken = r.data!.token!;

        await SecureLocalStorage.set(
          key: SecureLocalStorage.userTokenKey,
          value: r.data!.token,
        );

        await SecureLocalStorage.set(
          key: SecureLocalStorage.userCompeleteRequriedData,
          value: "false",
        );
        emit(SuccessAuth());
      },
    );
  }

  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController licenceNumberController = TextEditingController();

  List<String> types = ['Car', 'bike', 'bicycle'];
  String type = 'Car';
  String typeCarNumber = '1';

  String drivingLicenseImage = '';
  String nationalIDImage = '';

  typeVehicle(value) {
    if (value == 'Car') {
      type = 'Car';
      typeCarNumber = '1';
    } else if (value == 'bike') {
      type = 'bike';
      typeCarNumber = '2';
    } else {
      type = 'bicycle';
      typeCarNumber = '3';
    }
    emit(ChangeVehicleType());
  }

  selectDriveLicense(image) {
    drivingLicenseImage = image;
    emit(LicenseImage());
  }

  selectOneNational(image) {
    nationalIDImage = image;
    emit(NationalImage());
  }

  uploadDocument(context) async {
    emit(LoadingAuth());
    final result = await authRepository.uploadDocument(
      model: UploadDocParamModel(
        carType: typeCarNumber,
        vehicleNumber: vehicleNumberController.text,
        licenseNumber: licenceNumberController.text,
        drivingLicenseImage: drivingLicenseImage,
        nationalIDImage: nationalIDImage,
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
