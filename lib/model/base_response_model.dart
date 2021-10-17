

class BaseResponse<T> {
  final T data;
  final int statusCode;
  final String errorMessage;

  BaseResponse({this.data, this.statusCode, this.errorMessage});

  factory BaseResponse.of({T data, int statusCode, String errorMessage}) {
    return BaseResponse(
        data: data, statusCode: statusCode, errorMessage: errorMessage);
  }
}
