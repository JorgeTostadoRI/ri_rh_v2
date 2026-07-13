import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    super.key,
    required this.image,
    this.width,
    this.height,
  });

  final XFile image;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      Image.network(
        image.path,
        width: width,
        height: height,
      );
    }

    return FutureBuilder(
      future: image.readAsBytes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Image.memory(
            snapshot.data!,
            width: width,
            height: height,
          );
        }
        return SizedBox.shrink();
      }
    );
  }
}