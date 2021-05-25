abstract class Failure implements Exception {
  final String message;

  Failure({required this.message});

  @override
  String toString() {
    return message;
  }
}

class ServerError extends Failure {
  ServerError(String message) : super(message: message);
}

class UnknownError extends Failure {
  UnknownError(String message) : super(message: message);
}
