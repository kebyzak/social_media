// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_media_app/data/services/photo_repository.dart';
import 'package:social_media_app/domain/models/photo.dart';

part 'photo_state.dart';
part 'photo_event.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository photoRepository;

  PhotoBloc({required this.photoRepository}) : super(PhotoInitial()) {
    on<GetPhotos>((event, state) async {
      emit(PhotoLoading());
      try {
        final photos = await photoRepository.getPhotos();
        emit(PhotoSuccess(photos));
      } catch (e) {
        emit(PhotoError());
      }
    });
  }
}
