// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthModel> _$authModelSerializer = new _$AuthModelSerializer();

class _$AuthModelSerializer implements StructuredSerializer<AuthModel> {
  @override
  final Iterable<Type> types = const [AuthModel, _$AuthModel];
  @override
  final String wireName = 'AuthModel';

  @override
  Iterable<Object> serialize(Serializers serializers, AuthModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.apiKey != null) {
      result
        ..add('apiKey')
        ..add(serializers.serialize(object.apiKey,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AuthModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'apiKey':
          result.apiKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthModel extends AuthModel {
  @override
  final String apiKey;

  factory _$AuthModel([void Function(AuthModelBuilder) updates]) =>
      (new AuthModelBuilder()..update(updates)).build();

  _$AuthModel._({this.apiKey}) : super._();

  @override
  AuthModel rebuild(void Function(AuthModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthModelBuilder toBuilder() => new AuthModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthModel && apiKey == other.apiKey;
  }

  @override
  int get hashCode {
    return $jf($jc(0, apiKey.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthModel')..add('apiKey', apiKey))
        .toString();
  }
}

class AuthModelBuilder implements Builder<AuthModel, AuthModelBuilder> {
  _$AuthModel _$v;

  String _apiKey;
  String get apiKey => _$this._apiKey;
  set apiKey(String apiKey) => _$this._apiKey = apiKey;

  AuthModelBuilder();

  AuthModelBuilder get _$this {
    if (_$v != null) {
      _apiKey = _$v.apiKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthModel;
  }

  @override
  void update(void Function(AuthModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthModel build() {
    final _$result = _$v ?? new _$AuthModel._(apiKey: apiKey);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
