import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class MyWidgetBanner extends StatefulWidget {
  const MyWidgetBanner({super.key});

  @override
  State<MyWidgetBanner> createState() => _MyWidgetBannerState();
}

class _MyWidgetBannerState extends State<MyWidgetBanner> {
  ValueNotifier _dotNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [carouselSlider()],
    );
  }

  Widget carouselSlider() {
    return Stack(children: [
      Image.asset(
        "assets/image/image_background_for_carousel_slider.png",
        height: 250,
        width: 420,
        fit: BoxFit.cover,
      ),
      Positioned(
        height: 250,
        width: 420,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200,
            onPageChanged: (index, reason) {
              _dotNotifier.value = index;
            },
            aspectRatio: 2 / 1,
            autoPlay: true,
            viewportFraction: 1,
            enlargeFactor: 1,
            initialPage: 0,
          ),
          items: [
            "assets/image/image_homepage_carousel_slider_1.jpg",
            "assets/image/image_homepage_carousel_slider_2.png",
            "assets/image/image_homepage_carousel_slider_3.jpg",
            "assets/image/image_homepage_carousel_slider_4.png",
            "assets/image/image_homepage_carousel_slider_5.png"
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "$i",
                    width: 330,
                    fit: BoxFit.fill,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
      Positioned(
        top: 200,
        left: 150,
        child: ValueListenableBuilder(
            valueListenable: _dotNotifier,
            builder: (context, value, child) {
              return DotsIndicator(
                dotsCount: 5,
                position: _dotNotifier.value,
                decorator: DotsDecorator(
                  color: Colors.black,
                  size: const Size.square(16.0),
                  activeSize: const Size(24.0, 14.0),
                  activeColor: Colors.deepOrange,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              );
            }),
      ),
    ]);
  }
}
