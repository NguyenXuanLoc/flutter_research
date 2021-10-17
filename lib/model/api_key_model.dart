import 'dart:convert';

ApiKey apiKeyFromJson(String str) => ApiKey.fromJson(json.decode(str));

String apiKeyToJson(ApiKey data) => json.encode(data.toJson());

class ApiKey {
  ApiKey({
    this.apiKey,
  });

  String apiKey;

  factory ApiKey.fromJson(Map<String, dynamic> json) => ApiKey(
        apiKey: json["apiKey"],
      );

  Map<String, dynamic> toJson() => {
        "apiKey": apiKey,
      };
}
