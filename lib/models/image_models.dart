import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'image_models.g.dart';

abstract class UnsplashImage implements Built<UnsplashImage, UnsplashImageBuilder> {
  UnsplashImage._();

  factory UnsplashImage([updates(UnsplashImageBuilder b)]) = _$UnsplashImage;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'urls')
  Urls get urls;

  @nullable
  bool get isLiked;

  static Serializer<UnsplashImage> get serializer => _$unsplashImageSerializer;
}

abstract class Urls implements Built<Urls, UrlsBuilder> {
  Urls._();

  factory Urls([updates(UrlsBuilder b)]) = _$Urls;

  @nullable
  @BuiltValueField(wireName: 'regular')
  String get regular;

  @nullable
  @BuiltValueField(wireName: 'small')
  String get small;

  static Serializer<Urls> get serializer => _$urlsSerializer;
}