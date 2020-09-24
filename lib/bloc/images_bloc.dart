import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:unsplash_test_app/models/image_models.dart';
import 'package:unsplash_test_app/repository/images_repository.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final ImagesRepository imagesRepository = ImagesRepository();
  
  static const int PAGE_SIZE = 10;
  int _page = 1;

  Set<String> likedImages = {};
  BuiltList<UnsplashImage> images;
  ImagesBloc();

  @override
  ImagesState get initialState => LoadingImagesState();

  @override
  Stream<ImagesState> mapEventToState(
    ImagesEvent event,
  ) async* {
    if (event is FetchImagesEvent) {
      yield* _handleFetchImagesEvent();
    }
    if (event is FetchImagesNextPageEvent) {
      yield* _handleFetchImagesNextPageEvent();
    }
    if (event is LikeImageEvent) {
      yield* _handleLikeImageEvent(event.id);
    }
  }

  Stream<ImagesState> _handleFetchImagesEvent() async* {
    if (!(state is IdleImagesState)) {
      yield LoadingImagesState();
    }

    try {
      images = await imagesRepository.getPhotos(_page, PAGE_SIZE);
      yield IdleImagesState(
        images: images,
      );
    } catch (ex) {
      yield ErrorImagesState(ex);
    }
  }

  Stream<ImagesState> _handleFetchImagesNextPageEvent() async* {
    if (!(state is IdleImagesState)) {
      yield LoadingImagesState();
    }

    try {
      final nextPageImages = await imagesRepository.getPhotos(++_page, PAGE_SIZE);
      final builder = images.toBuilder();
      builder.addAll(nextPageImages);
      images = builder.build();
      
      yield IdleImagesState(
        images: images,
      );
    } catch (ex) {
      yield ErrorImagesState(ex);
    }
  }

  Stream<ImagesState> _handleLikeImageEvent(id) async* {
    if (likedImages.contains(id)) {
      likedImages.remove(id);
    } else {
      likedImages.add(id);
    }
    yield UpdateImageState();
    yield IdleImagesState(
      images: images,
    );
  }
}
