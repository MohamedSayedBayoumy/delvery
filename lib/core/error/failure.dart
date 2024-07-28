abstract class FailureHandler {
  final String message;
  final bool status;
  final List<dynamic> failuresCases;

  FailureHandler(
      {required this.message,
      required this.status,
      this.failuresCases = const []});
}

class FailureCase extends FailureHandler {
  FailureCase({
    required super.message,
    required super.status,
    required super.failuresCases ,
  });
}
