// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApiError> _$apiErrorSerializer = new _$ApiErrorSerializer();

class _$ApiErrorSerializer implements StructuredSerializer<ApiError> {
  @override
  final Iterable<Type> types = const [ApiError, _$ApiError];
  @override
  final String wireName = 'ApiError';

  @override
  Iterable<Object> serialize(Serializers serializers, ApiError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ApiError deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ApiError extends ApiError {
  @override
  final String error;

  factory _$ApiError([void Function(ApiErrorBuilder) updates]) =>
      (new ApiErrorBuilder()..update(updates)).build();

  _$ApiError._({this.error}) : super._();

  @override
  ApiError rebuild(void Function(ApiErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiErrorBuilder toBuilder() => new ApiErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ApiError')..add('error', error))
        .toString();
  }
}

class ApiErrorBuilder implements Builder<ApiError, ApiErrorBuilder> {
  _$ApiError _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  ApiErrorBuilder();

  ApiErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ApiError;
  }

  @override
  void update(void Function(ApiErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ApiError build() {
    final _$result = _$v ?? new _$ApiError._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
