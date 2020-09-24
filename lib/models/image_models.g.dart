// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnsplashImage> _$unsplashImageSerializer =
    new _$UnsplashImageSerializer();
Serializer<Urls> _$urlsSerializer = new _$UrlsSerializer();

class _$UnsplashImageSerializer implements StructuredSerializer<UnsplashImage> {
  @override
  final Iterable<Type> types = const [UnsplashImage, _$UnsplashImage];
  @override
  final String wireName = 'UnsplashImage';

  @override
  Iterable<Object> serialize(Serializers serializers, UnsplashImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'urls',
      serializers.serialize(object.urls, specifiedType: const FullType(Urls)),
    ];
    if (object.isLiked != null) {
      result
        ..add('isLiked')
        ..add(serializers.serialize(object.isLiked,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  UnsplashImage deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnsplashImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'urls':
          result.urls.replace(serializers.deserialize(value,
              specifiedType: const FullType(Urls)) as Urls);
          break;
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UrlsSerializer implements StructuredSerializer<Urls> {
  @override
  final Iterable<Type> types = const [Urls, _$Urls];
  @override
  final String wireName = 'Urls';

  @override
  Iterable<Object> serialize(Serializers serializers, Urls object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.regular != null) {
      result
        ..add('regular')
        ..add(serializers.serialize(object.regular,
            specifiedType: const FullType(String)));
    }
    if (object.small != null) {
      result
        ..add('small')
        ..add(serializers.serialize(object.small,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Urls deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UrlsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'regular':
          result.regular = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'small':
          result.small = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UnsplashImage extends UnsplashImage {
  @override
  final String id;
  @override
  final Urls urls;
  @override
  final bool isLiked;

  factory _$UnsplashImage([void Function(UnsplashImageBuilder) updates]) =>
      (new UnsplashImageBuilder()..update(updates)).build();

  _$UnsplashImage._({this.id, this.urls, this.isLiked}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('UnsplashImage', 'id');
    }
    if (urls == null) {
      throw new BuiltValueNullFieldError('UnsplashImage', 'urls');
    }
  }

  @override
  UnsplashImage rebuild(void Function(UnsplashImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnsplashImageBuilder toBuilder() => new UnsplashImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnsplashImage &&
        id == other.id &&
        urls == other.urls &&
        isLiked == other.isLiked;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), urls.hashCode), isLiked.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UnsplashImage')
          ..add('id', id)
          ..add('urls', urls)
          ..add('isLiked', isLiked))
        .toString();
  }
}

class UnsplashImageBuilder
    implements Builder<UnsplashImage, UnsplashImageBuilder> {
  _$UnsplashImage _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  UrlsBuilder _urls;
  UrlsBuilder get urls => _$this._urls ??= new UrlsBuilder();
  set urls(UrlsBuilder urls) => _$this._urls = urls;

  bool _isLiked;
  bool get isLiked => _$this._isLiked;
  set isLiked(bool isLiked) => _$this._isLiked = isLiked;

  UnsplashImageBuilder();

  UnsplashImageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _urls = _$v.urls?.toBuilder();
      _isLiked = _$v.isLiked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnsplashImage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UnsplashImage;
  }

  @override
  void update(void Function(UnsplashImageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UnsplashImage build() {
    _$UnsplashImage _$result;
    try {
      _$result = _$v ??
          new _$UnsplashImage._(id: id, urls: urls.build(), isLiked: isLiked);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'urls';
        urls.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UnsplashImage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Urls extends Urls {
  @override
  final String regular;
  @override
  final String small;

  factory _$Urls([void Function(UrlsBuilder) updates]) =>
      (new UrlsBuilder()..update(updates)).build();

  _$Urls._({this.regular, this.small}) : super._();

  @override
  Urls rebuild(void Function(UrlsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UrlsBuilder toBuilder() => new UrlsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Urls && regular == other.regular && small == other.small;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, regular.hashCode), small.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Urls')
          ..add('regular', regular)
          ..add('small', small))
        .toString();
  }
}

class UrlsBuilder implements Builder<Urls, UrlsBuilder> {
  _$Urls _$v;

  String _regular;
  String get regular => _$this._regular;
  set regular(String regular) => _$this._regular = regular;

  String _small;
  String get small => _$this._small;
  set small(String small) => _$this._small = small;

  UrlsBuilder();

  UrlsBuilder get _$this {
    if (_$v != null) {
      _regular = _$v.regular;
      _small = _$v.small;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Urls other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Urls;
  }

  @override
  void update(void Function(UrlsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Urls build() {
    final _$result = _$v ?? new _$Urls._(regular: regular, small: small);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
