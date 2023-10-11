import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Gallery extends StatefulWidget {
  final List<String> images;
  final PageController pageController;
  final int index;

  Gallery({this.images, this.index})
      : pageController = PageController(initialPage: index);
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(widget.images[index]),
                          initialScale: PhotoViewComputedScale.contained,
                          heroAttributes: PhotoViewHeroAttributes(tag: index));
                    },
                    itemCount: widget.images.length,
                    loadingBuilder: (context, event) => Center(
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                                value: event == null
                                    ? 0
                                    : event.cumulativeBytesLoaded /
                                        event.expectedTotalBytes),
                          ),
                        ),
                    pageController: widget.pageController)),
            Positioned(
                left: 10,
                top: 10,
                child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.cancel, size: 30, color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
