part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class CheckDoneState extends ProfileState {}

final class SetUserImage extends ProfileState {}

final class SuccessGetUserData extends ProfileState {}

final class SuccessLogout extends ProfileState {
  final String message;

  SuccessLogout({required this.message});
}

final class FailureProfileCase extends ProfileState {
  final String message;

  FailureProfileCase({required this.message});
}
