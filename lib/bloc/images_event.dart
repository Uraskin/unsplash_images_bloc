part of 'images_bloc.dart';

abstract class ImagesEvent extends Equatable {
  const ImagesEvent();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => null;
}

class FetchImagesEvent extends ImagesEvent {}

class FetchImagesNextPageEvent extends ImagesEvent {}

class LikeImageEvent extends ImagesEvent {
  final String id;

  LikeImageEvent(this.id);

  @override
  List<Object> get props => [id];
}
