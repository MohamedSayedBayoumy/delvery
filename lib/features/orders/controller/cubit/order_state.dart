part of 'order_cubit.dart';

sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class LoadingOrderCase extends OrderState {}

final class GetUserStatus extends OrderState {}

final class SuccessChangeUserStatus extends OrderState {}

final class FailureChangeUserStatus extends OrderState {
  final String message;

  FailureChangeUserStatus({required this.message});
}
