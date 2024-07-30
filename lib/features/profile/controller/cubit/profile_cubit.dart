import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mts/core/services/local_storage/local_storage.dart';

import '../../../../model/repo_pattern/auth_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.authRepository}) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  AuthRepository authRepository;

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
