import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';

class MyCarouselSliderController extends GetxController {
  final List<String> urls =
      <String>[
        'https://www.shutterstock.com/image-photo/businessman-working-stock-traders-making-260nw-2207859513.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM2CIyRBcMfAn9_QadqBB9dxgYXfhYrKWxPQ&s',
        'https://i.pinimg.com/736x/81/d1/e7/81d1e74bf75167affe7d989324f0cb1d.jpg',
      ].obs;

  // Track current page
  final currentIndex = 0.obs;

  void updateIndex(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }
}
