import 'package:dio/dio.dart';
import 'package:social_media_app/domain/models/photo.dart';

class PhotoRepository {
  final Dio dio;

  PhotoRepository(this.dio);

  Future<List<Photo>> getPhotos() async {
    try {
      final response = await dio.get('https://picsum.photos/v2/list');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.take(12).map((json) => Photo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      rethrow;
    }
  }
}
