import 'package:flutter/material.dart';

class PhotoDetail extends StatelessWidget {
  final String imageUrl;

  const PhotoDetail({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
