abstract class FailureHandler {
  final String message;
  final String status;

  FailureHandler({required this.message, required this.status});
}

class FailureCase extends FailureHandler {
  FailureCase({required super.message, required super.status});
}
