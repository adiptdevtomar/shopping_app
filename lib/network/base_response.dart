class BaseResponse {
  dynamic data;
  Status? status;
  String? message;

  BaseResponse({
    this.data,
    this.status,
    this.message,
  });

  factory BaseResponse.init() => BaseResponse(
    status: Status.init,
  );

  factory BaseResponse.loading() => BaseResponse(
        status: Status.loading,
      );

  factory BaseResponse.success(dynamic data) => BaseResponse(
        data: data,
        status: Status.success,
      );

  factory BaseResponse.error(dynamic data, {String? message}) => BaseResponse(
        status: Status.error,
        data: data,
        message: message,
      );
}

enum Status {
  init,
  success,
  loading,
  error,
}
