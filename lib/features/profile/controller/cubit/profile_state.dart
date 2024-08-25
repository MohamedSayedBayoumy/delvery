part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class HistoryLoading extends ProfileState {}

final class CheckDoneState extends ProfileState {}

final class SetUserImage extends ProfileState {}

final class SuccessGetUserData extends ProfileState {}

final class SuccessGetHistoryData extends ProfileState {}

final class SuccessGetBalance extends ProfileState {}

final class ChangeTab extends ProfileState {}

final class ChangePasswordLoading extends ProfileState {}

final class SuccessLogout extends ProfileState {
  final String message;

  SuccessLogout({required this.message});
}

final class FailureProfileCase extends ProfileState {
  final String message;

  FailureProfileCase({required this.message});
}
