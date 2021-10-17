import 'package:chopper/chopper.dart';
import 'package:flutter_research/common/share_pref_common.dart';

part 'service.chopper.dart';

@ChopperApi(baseUrl: "")
abstract class NoteService extends ChopperService {
  static const String PATH_GET_API_KEY = "apiKey";
  static const String PATH_GET_NOTE = "notes";

  static NoteService create() {
    final client = ChopperClient(
        baseUrl: "https://tq-notes-api-jkrgrdggbq-el.a.run.app/",
        converter: JsonConverter(),
        services: [
          _$NoteService()
        ],
        interceptors: [
          HeadersInterceptor({"accept": "*/*"}),
          HeadersInterceptor({"apiKey": PrefCommon.getAccessToken()}),
          HttpLoggingInterceptor(),
          CurlInterceptor(),
        ]);
    return _$NoteService(client);
  }

  @Get(path: PATH_GET_API_KEY)
  Future<Response> getApiKey();

  @Get(path: PATH_GET_NOTE)
  Future<Response> getNote();
}
