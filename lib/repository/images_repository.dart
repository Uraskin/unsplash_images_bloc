import 'package:built_collection/built_collection.dart';
import 'package:unsplash_test_app/models/image_models.dart';
import 'package:unsplash_test_app/api/a_http_client.dart';

class ImagesRepository {
  Future<BuiltList<UnsplashImage>> getPhotos(int page, int perPage) async {
      return httpClient.getList('/photos?page=$page&per_page=$perPage');
  }
}