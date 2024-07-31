import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_storage/local_storage.dart';
import '../../../../model/model/profile_model/user_data_model.dart';
import '../../../../model/repo_pattern/auth_repo.dart';
import '../../../../model/repo_pattern/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.authRepository, required this.profileRepository})
      : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  AuthRepository authRepository;

  ProfileRepository profileRepository;

  UserDataModel? userDataModel;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String countryCode = "";

  getUserData(context) async {
    emit(ProfileLoading());
    final reuslt = await profileRepository.getUserDate();

    Navigator.pop(context);

    reuslt.fold(
      (l) {
        emit(FailureProfileCase(message: l.message));
      },
      (r) {
        userDataModel = r;
        nameController.text = userDataModel!.data!.name!;
        emailController.text = userDataModel!.data!.email!;
        phoneController.text = userDataModel!.data!.phoneNumber!.split("`")[1];

        countryCode = userDataModel!.data!.phoneNumber!.split("`")[0];
        emit(SuccessGetUserData());
      },
    );
  }

  logout() async {
    emit(ProfileLoading());
    final reuslt = await authRepository.logout();

    reuslt.fold(
      (l) {
        emit(FailureProfileCase(message: l.message));
      },
      (r) {
        SecureLocalStorage.disposeAll();
        emit(SuccessLogout(message: "Successfully logged out"));
      },
    );
  }
}
