class HttpException implements Exception {
  final int code;
  final String message;

  HttpException(this.code, this.message) : assert (code != null);

  @override
  String toString() {
    return 'HttpException{code: $code, message: $message}';
  }
}