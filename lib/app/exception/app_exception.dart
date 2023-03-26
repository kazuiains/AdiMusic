class AppException implements Exception {
  final String? code;
  final String? message;
  final String? details;
  final String? from;

  AppException({
    this.code,
    this.message,
    this.details,
    this.from,
  });

  @override
  String toString() {
    return "[$from - $code]: $message | $details";
  }
}
