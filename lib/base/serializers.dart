import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:unsplash_test_app/models/error_models.dart';
import 'package:unsplash_test_app/models/image_models.dart';
import 'package:flutter/foundation.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  ApiError,
  UnsplashImage,
  Urls
])
final Serializers serializers = _$serializers;

Serializers standardSerializers = (serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
).build();

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

_parseAndDecode(String response) {
  return jsonDecode(response);
}