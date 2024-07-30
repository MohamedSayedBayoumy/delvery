import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/repo_pattern/auth_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.authRepository) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  AuthRepository authRepository;

  logout() async {
    final reuslt = await authRepository.logout();

    reuslt.fold(
      (l) {
        emit(FailureProfileCase(message: l.message));
      },
      (r) {
        emit(SuccessLogout(message: "Successfully logged out"));
      },
    );
  }
}
