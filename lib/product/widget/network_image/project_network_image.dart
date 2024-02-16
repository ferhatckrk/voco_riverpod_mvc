import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProjectNetworkImage extends StatelessWidget {
  const ProjectNetworkImage(
      {super.key, required this.imagePath, this.height, this.widht});

  final String imagePath;
  final double? widht;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      height: height,
      width: widht,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
