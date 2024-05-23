import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatefulWidget {
  // images path
  final List<String> images;
  // by default photo
  final String? title;
  // index 0
  final int index;
  const PhotoViewPage({
    Key? key,
    required this.images,
    this.title,
    this.index = 0,
  }) : super(key: key);

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  final _pageController = PageController();
  final _photoViewController = PhotoViewController();

  final List<String> _images = [];

  @override
  void initState() {
    _images.addAll(widget.images);
    Future.delayed(const Duration(milliseconds: 10), () {
      _pageController.jumpToPage(widget.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _photoViewController.dispose();
    _images.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // we can show photo and zoom in and zoom out
      body: PageView(
        controller: _pageController,
        children: _images.map((image) {
          return Uri.parse(image).isAbsolute
              ? PhotoView(
                  controller: _photoViewController,
                  imageProvider: CachedNetworkImageProvider(image),
                  minScale: PhotoViewComputedScale.contained,
                )
              : PhotoView(
                  controller: _photoViewController,
                  imageProvider: FileImage(File(image)),
                  minScale: PhotoViewComputedScale.contained,
                );
        }).toList(),
      ),
    );
  }
}
