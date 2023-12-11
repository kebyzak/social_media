import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/domain/models/photo.dart';
import 'package:social_media_app/generated/l10n.dart';
import 'package:social_media_app/presentation/blocs/photo/photo_bloc.dart';
import 'package:social_media_app/presentation/screens/photo/photo_detail.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PhotoBloc>(context).add(GetPhotos());

    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        if (state is PhotoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PhotoSuccess) {
          return _buildGrid(state.photos);
        } else if (state is PhotoError) {
          return Center(child: Text(S.of(context).failedToLoadPhotos));
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildGrid(List<Photo> photos) {
    return Container(
      color: Colors.white,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PhotoDetail(imageUrl: photos[index].url),
                ),
              );
            },
            child: Image.network(
              photos[index].url,
              fit: BoxFit.cover,
              width: 500,
              height: 500,
            ),
          );
        },
      ),
    );
  }
}
