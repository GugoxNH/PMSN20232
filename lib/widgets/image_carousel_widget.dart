// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String?> imgList = [
  "assets/img/space1.png",
  "assets/img/space2.png",
  "assets/img/space3.png"
];

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imgList
            .map((item) => Container(
                  child: Center(child: Image.asset(item.toString())),
                ))
            .toList(),
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.map((url) {
          int? index = imgList.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? const Color.fromRGBO(1, 1, 1, 0.9)
                  : const Color.fromRGBO(1, 1, 1, 0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
