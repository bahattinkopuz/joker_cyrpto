import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailFullScreen extends StatelessWidget {
  final String imagePath;
  DetailFullScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(child: PhotoView(imageProvider: NetworkImage(imagePath)));
  }
}
