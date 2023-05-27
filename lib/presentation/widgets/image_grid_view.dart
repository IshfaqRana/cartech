import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageGridWidget extends StatelessWidget {
  final List<XFile> images;

  const ImageGridWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: images.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of items per row
        mainAxisSpacing: 8.0, // Spacing between rows
        crossAxisSpacing: 8.0, // Spacing between columns
      ),
      itemBuilder: (BuildContext context, int index) {
        final image = images[index];
        return Image.file(File(image.path));
      },
    );
  }
}
