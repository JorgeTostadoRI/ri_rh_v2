import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    super.key,
    required this.image,
  });

  final XFile image;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      Image.network(image.path);
    }

    return FutureBuilder(
      future: image.readAsBytes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Image.memory(snapshot.data!);
        }
        return SizedBox.shrink();
      }
    );
  }
}