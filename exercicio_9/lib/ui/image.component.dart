import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final String imagePath;
  final Function errorBuilder;

  const ImageComponent({@required this.imagePath, this.errorBuilder});

  _buildError() {
    return Center(
      child: Icon(
        Icons.broken_image,
        color: Colors.white,
        size: 50,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      fit: BoxFit.fill,
      width: double.infinity,
      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent loadingProgress,
      ) {
        if (loadingProgress == null) return child;
        return Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (BuildContext context, Object e, StackTrace stackTrace) {
        if (this.errorBuilder != null) return this.errorBuilder();

        return _buildError();
      },
    );
  }
}
