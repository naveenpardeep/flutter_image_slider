import 'package:flutter/material.dart';

class ImageCarouselSlider extends StatelessWidget {
  final List<String> items;
  final Color? dotColor;
  final double? imageHeight;
  const ImageCarouselSlider(
      {super.key, required this.items, this.dotColor, this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //imagePArt here
          ImageSliderView(
            imagesPath: items,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ImageSliderView extends StatefulWidget {
  //get imageURLs

  final List<String> imagesPath;

  final Color? dotColor;
  // or use aspect ratio
  final double? imageHeight;

  const ImageSliderView(
      {super.key, this.imageHeight, required this.imagesPath, this.dotColor});

  @override
  State<ImageSliderView> createState() => _ImageSliderViewState();
}

class _ImageSliderViewState extends State<ImageSliderView> {
  int _current = 0;
  final PageController _pageController = PageController();
  double fiximageHeight = 200;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _current = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterView = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < widget.imagesPath.length; i++)
          Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _current == i ? widget.dotColor ?? Colors.blue : Colors.grey,
            ),
          ),
      ],
    );
    return SizedBox(
      height: widget.imageHeight ?? fiximageHeight,
      child: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
                itemCount: widget.imagesPath.length,
                controller: _pageController,
                itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.imagesPath[index],
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                      ),
                    )),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: counterView,
          )
        ],
      ),
    );
  }
}
