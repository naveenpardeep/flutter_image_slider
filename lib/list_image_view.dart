import 'package:flutter/material.dart';
import 'package:flutter_image_carousel_slider/photo_view_page.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ImageListView extends StatefulWidget {
  // images path
  final List<String> imageList;
  const ImageListView({super.key, required this.imageList});

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // show images in grid view
            crossAxisCount:
                widget.imageList.length == 1 || widget.imageList.length == 2
                    ? 1
                    : 2,
            mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
            crossAxisSpacing: MediaQuery.of(context).size.height * 0.01,
          ),
          itemCount: widget.imageList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                border: GradientBoxBorder(
                  width: 2,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF8942BC),
                      Color(0xFF5831F7),
                      Color(0xFF5731F8),
                      Color(0xFF00C2C2),
                    ],
                  ),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhotoViewPage(
                              images: [widget.imageList[index]],
                            )),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.imageList[index],
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
