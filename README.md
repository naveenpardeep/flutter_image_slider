
Flutter image carousel slider 

## Features

Fast flutter image carousel slider and smooth slides 

## Getting started

to use this package import the latest package and directly pass the images path 
like this-->
  CardItemView(items: imageList),

  ![image](https://github.com/naveenpardeep/flutter_image_slider/assets/42085829/376bfff5-c54f-4b96-8f77-2ec02599b9c8)

To show images in gallery view just use like this 
                  InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ImageListView(
                                imageListed: imageList,
                              );
                            }));
                           
                          },
                          child:
                              CardItemView(items:imageList),
                        ),

![image](https://github.com/naveenpardeep/flutter_image_slider/assets/42085829/dcd4093a-95da-484c-89f8-757a65dd37f4)
