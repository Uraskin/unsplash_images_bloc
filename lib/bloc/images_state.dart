part of 'images_bloc.dart';

abstract class ImagesState extends Equatable {
  const ImagesState();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => null;
}

class IdleImagesState extends ImagesState {
  final BuiltList<UnsplashImage> images;

  IdleImagesState({
    this.images,
  });

  @override
  List<Object> get props => [
        images,
      ];
}

class LoadingImagesState extends ImagesState {}

class ErrorImagesState extends ImagesState {
  final Exception error;

  ErrorImagesState(this.error);

  @override
  List<Object> get props => [error];
}

class UpdateImageState extends ImagesState {}
