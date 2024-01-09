abstract class Failure {
  final String msg;
  Failure(this.msg);
}

class FailedError extends Failure {
  FailedError(String msg) : super(msg);
}
