// serializers.dart

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_research/model/auth_model.dart';

part 'serializers.g.dart';

@SerializersFor([AuthModel])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
