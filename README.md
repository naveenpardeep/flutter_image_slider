
Flutter image carousel slider 

## Features

Fast flutter image carousel slider and smooth slides 

## Getting started
A carousel slider in Flutter is a UI widget used to display a series of items horizontally in a scrolling manner, typically with one item visible at a time. It allows users to swipe or scroll through the items, providing a visually appealing and interactive way to navigate content.
Image carousels, commonly referred to as sliders, are interactive elements on web pages that showcase multiple images or content pieces in a rotating sequence. Originating as simple photo sliders, their evolution has been influenced significantly by advancements in web technology.


to use this package import the latest package and directly pass the images path 
like this-->
 
  
  ImageCarouselSlider(items: imageList),

  ![image](https://github.com/naveenpardeep/flutter_image_slider/assets/42085829/376bfff5-c54f-4b96-8f77-2ec02599b9c8)

To show images in gallery view just use like this 
                 
                  
     InkWell(
             onTap: () {
                 Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) {
                              return ImageListView(
                                imageList: imageList,
                              );
                            }));
                           
                          },
          child:
             ImageCarouselSlider(
                  items: imageList,
                  imageHeight: 300,
                  dotColor: Colors.black,
                ),
                        ),

![image](https://github.com/naveenpardeep/flutter_image_slider/assets/42085829/dcd4093a-95da-484c-89f8-757a65dd37f4)

 /// To show image carousel left right viewportFraction
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
                child: ImageCarouselSliderLeftRightShow(
                  items: imageList,
                  imageHeight: 300,
                  dotColor: Colors.black,
                ),
              ),

  ![image](https://github.com/user-attachments/assets/b24b333a-dad6-4ee1-a35b-aaf9de0da4d3)            


Any help or suggestion contact me naveensheoran1000@gmail.com or telegram @NaveenSheoran777