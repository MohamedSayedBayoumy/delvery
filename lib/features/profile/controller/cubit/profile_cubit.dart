import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_storage/local_storage.dart';
import '../../../../model/model/profile_model/balance_model.dart';
import '../../../../model/model/profile_model/history_model.dart';
import '../../../../model/model/profile_model/update_user_image.dart';
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

  HistoryModel? historyModel;

  TotalBalanceModel? totalBalanceModel;

  Color currentColor = Colors.green;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController vichleTypeController = TextEditingController();
  TextEditingController vichleNumberController = TextEditingController();
  TextEditingController licenceNumberController = TextEditingController();

  String idImage = '';
  String licenseImage = '';

  String countryCode = "";

  String userImage = "";

  setImage(image) {
    userImage = image;
    emit(SetUserImage());
  }

  getUserData(context, {bool getDocument = false}) async {
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
        phoneController.text = userDataModel!.data!.phoneNumber!;
        userImage = userDataModel!.data!.personalPhoto!;
        if (getDocument == true) {
          if (userDataModel!.data!.carType == "1") {
            vichleTypeController.text = "Car";
          } else if (userDataModel!.data!.carType == "1") {
            vichleTypeController.text = "bike";
          } else {
            vichleTypeController.text = "bicycle";
          }
          vichleNumberController.text = userDataModel!.data!.carNumber!;
          licenceNumberController.text = userDataModel!.data!.licenseNumber!;
          idImage = userDataModel!.data!.idImage!;
          licenseImage = userDataModel!.data!.licenseImage!;
        }

        emit(SuccessGetUserData());
      },
    );
  }

  logout(context) async {
    emit(ProfileLoading());
    final reuslt = await authRepository.logout();
    Navigator.pop(context);

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

  updataUserProfileData(context) async {
    emit(ProfileLoading());
    final reuslt = await profileRepository.updateUesr(
      data: ProfileParam(
        userId: userDataModel!.data!.id!,
        name: nameController.text,
        email: emailController.text,
        image: userImage,
      ),
    );

    Navigator.pop(context);

    reuslt.fold(
      (l) {
        emit(FailureProfileCase(message: l.message));
      },
      (r) {
        Navigator.pop(context);
      },
    );
  }

  bool userHaveOrder = false;

  userHaveOrderInProcess() async {
    final order = await SecureLocalStorage.get(SecureLocalStorage.orderById);
    if (order == "empty") {
      userHaveOrder = false;
    } else {
      userHaveOrder = true;
    }
    emit(CheckDoneState());
  }

  getHistory(context, {status}) async {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        emit(HistoryLoading());
        final reuslt = await profileRepository.historyDate(status);

        Navigator.pop(context);

        reuslt.fold(
          (l) {
            emit(FailureProfileCase(message: l.message));
          },
          (r) {
            historyModel = r;

            emit(SuccessGetHistoryData());
          },
        );
      },
    );
  }

  void changeTab(int i, BuildContext context) {
    if (i == 1) {
      currentColor = Colors.red;
      getHistory(context, status: 5);
    } else {
      currentColor = Colors.green;
      getHistory(context, status: 4);
    }
    emit(ChangeTab());
  }

  getTotalBalance(context) async {
    emit(ProfileLoading());

    final reuslt = await profileRepository.getTotalBalance();

    Navigator.pop(context);

    reuslt.fold(
      (l) {
        emit(FailureProfileCase(message: l.message));
      },
      (r) {
        totalBalanceModel = r;
        emit(SuccessGetBalance());
      },
    );
  }
}
