import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mistrioncall/utils/constants/AppColor.dart';

import '../../utils/constants/CommonFunctions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'assets/images/hhh.png',
    'assets/images/hhh.png',
    'assets/images/hhh.png',
    'assets/images/hhh.png',
    'assets/images/hhh.png',
    // Add more image URLs as needed
  ];
  @override
  Widget build(BuildContext context) {
    CommonFunctions.customTheme();
    return Scaffold(
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: imgList.map((item) {
                    return Stack(
                      children: <Widget>[
                        Image.asset(item, fit: BoxFit.fill, width: double.infinity),
                      ],
                    );
                  }).toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                    autoPlay: false,
                    animateToClosest: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 20,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? AppColor.blue
                                : Colors.white)
                                .withOpacity(_current == entry.key ? 0.9 : 0.4),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}