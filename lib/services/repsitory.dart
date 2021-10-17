import 'dart:io';

import 'package:flutter_research/model/api_key_model.dart';
import 'package:flutter_research/model/base_response_model.dart';
import 'package:flutter_research/services/service.dart';

class Repository {
  NoteService service = NoteService.create();


  BaseResponse convertException<T>(dynamic ex) {
    if (ex is SocketException) {
      return BaseResponse<T>.of(
          statusCode: ex.osError.errorCode,
          errorMessage: "No Internet connection");
    }
    return BaseResponse<T>.of(
        statusCode: 0, errorMessage: "Attempts failed, please try again !!");
  }

  Future<BaseResponse<ApiKey>> getApiKey() async {
    try {
      var result = await service.getApiKey().timeout(Duration(seconds: 20));
      return BaseResponse.of(
          data: ApiKey.fromJson(result.body), statusCode: result.statusCode);
    } catch (ex) {
      return convertException<ApiKey>(ex);
    }
  }

  Future<void> getNote() async {
    try {
      var result = await service.getNote().timeout(Duration(seconds: 20));
      return null;
    } catch (ex) {
      return null;
    }
  }
}
