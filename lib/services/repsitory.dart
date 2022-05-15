import 'dart:io';

import 'package:flutter_research/model/api_key_model.dart';
import 'package:flutter_research/model/auth_model.dart';
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

  Future<BaseResponse<AuthModel>> getApiKey() async {
    try {
      var result = await service.getApiKey().timeout(Duration(seconds: 20));
      return BaseResponse.of(
          data: AuthModel.fromJson(result.bodyString),
          statusCode: result.statusCode);
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
  //ádfsf
  //   void uploadFile(String proofFrontPath, String proofBackPath) async {
//     print("PATH: $proofBackPath");
//     var map = {
//       "proofFront": MultipartFile(proofFrontPath, filename: proofFrontPath.split("/").last),
//       "proofBack": MultipartFile(proofBackPath, filename: proofBackPath.split("/").last)
//     };
//     FormData data = FormData(map);
//     var response =
//         await provider.PATCH("u/user_identifications/upload_proof", data);
//     if (response.error != null) {
//       print("TAG ERROR: ${response.error}");
//     } else {
//       if (response.data != null) {
//         print("TAG ERROR: ${response.data.toString()}");
//       }
//     }
//   }
}
