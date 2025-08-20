import 'package:flutter/material.dart';
import 'package:forex_trade/app/utils/carousel_slider/carousel_slider_controller.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithIndex extends StatelessWidget {
  final controller = Get.put(MyCarouselSliderController());

  CarouselWithIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider(
            // carouselController: CarouselSliderController(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 5,
              // aspectRatio: 16 / 9,
              // viewportFraction: 0.8,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              // enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged: controller.updateIndex,
            ),
            items:
                controller.urls.map((src) {
                  return Builder(
                    builder: (context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            src,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (ctx, err, st) => Container(
                                  color: Colors.grey[200],
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.broken_image,
                                    size: 100,
                                    color: Colors.red,
                                  ),
                                ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
          ),

          // Index overlay (bottom-center)
          Positioned(
            bottom: 20,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${controller.currentIndex.value + 1}/${controller.urls.length}',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      );
    });
  }
}
