part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoadingAuth extends AuthState {}

final class SuccessAuth extends AuthState {}

final class ShowPassword extends AuthState {}

final class FailureAuth extends AuthState {
  final String message;

  FailureAuth({required this.message});
}

final class ChangeVehicleType extends AuthState {}

final class LicenseImage extends AuthState {}
final class NationalImage extends AuthState {}

