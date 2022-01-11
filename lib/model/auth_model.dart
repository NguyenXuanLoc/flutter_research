import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_research/services/serializers.dart';

part 'auth_model.g.dart';

// {"apiKey":"8e2c902a-f82a-49c9-858a-eb8de55bdf11"}


/// AuthModel
abstract class AuthModel implements Built<AuthModel, AuthModelBuilder> {
  AuthModel._();

  factory AuthModel([Function(AuthModelBuilder b) updates]) = _$AuthModel;

  @nullable
  @BuiltValueField(wireName: 'apiKey')
  String get apiKey;


  String toJson() {
    return jsonEncode(serializers.serializeWith(AuthModel.serializer, this));
  }

  static AuthModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        AuthModel.serializer, jsonDecode(jsonString)).rebuild(
            (b) => b..apiKey ??= ''
    );
  }

  static List<AuthModel> fromListJson(String jsonString) {
    return jsonDecode(jsonString)
        .map<AuthModel>((e) => fromJson(jsonEncode(e)))
        .toList();
  }

  static Serializer<AuthModel> get serializer => _$authModelSerializer;
}