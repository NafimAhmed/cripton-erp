class ApiResponse {
  Object? data;
  int? totalCount;
  bool isSuccessful;
  int? statusCode;
  String? successMessage;
  String? errorMessage;
  ApiResponse({
    this.data,
    this.totalCount,
    required this.isSuccessful,
    this.statusCode,
    this.successMessage,
    this.errorMessage,
  });

  @override
  String toString() {
    return 'ApiResponse(data: $data, totalCount: $totalCount, isSuccessful: $isSuccessful, statusCode: $statusCode, successMessage: $successMessage, errorMessage: $errorMessage)';
  }
}
