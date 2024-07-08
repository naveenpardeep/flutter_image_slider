import 'package:flutter/material.dart';
import 'package:flutter_image_carousel_slider/image_carousel_slider.dart';
import 'package:flutter_image_carousel_slider/list_image_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image carousel slider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Image carousel slider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imageList = [
    "https://thumbs.dreamstime.com/z/luxury-yacht-mediteranean-sea-sardinia-26104031.jpg?ct=jpeg",
    "https://thumbs.dreamstime.com/z/luxury-yacht-sea-26613003.jpg?ct=jpeg",
    "https://thumbs.dreamstime.com/z/speed-boat-5750774.jpg?ct=jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ImageListView(
                      imageList: imageList,
                    );
                  }));
                },

                ///user can add image height and dots color
                child: ImageCarouselSlider(
                  items: imageList,
                  imageHeight: 300,
                  dotColor: Colors.black,
                ),
              ),
            ],
          ),
        ));
  }
}
