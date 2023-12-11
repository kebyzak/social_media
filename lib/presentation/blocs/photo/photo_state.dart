part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoSuccess extends PhotoState {
  final List<Photo> photos;

  const PhotoSuccess(this.photos);

  @override
  List<Object> get props => [photos];
}

class PhotoError extends PhotoState {}
