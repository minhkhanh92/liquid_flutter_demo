class ApiException implements Exception {
  final int? statusCode;
  final String? message;

  ApiException({
    this.statusCode,
    this.message,
  });
}
