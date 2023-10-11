import 'package:flutter/material.dart';

class CustomImageNetwork extends StatelessWidget {
  final String? image;

  const CustomImageNetwork({Key? key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Icon(Icons.error);
    }
    try {
      return Image.network(
        image!,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          print('Error Handler');
          return Container(
            child: Icon(
              Icons.error,
              size: 40,
            ),
          );
        },
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
    } catch (e) {
      print(e);
      return Image.asset("assets/images/image.jpg");
    }
  }
}
