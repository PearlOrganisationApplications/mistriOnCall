import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 270,
          color: Colors.transparent,
          child: Stack(
            children: [
              CarouselSlider(
                items: imgList.map((item) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        item,
                      ),
                    )),
                  );
                }).toList(),
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  animateToClosest: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1.5,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
              Positioned(
                  top: 16,
                  right: 16,
                  child: SvgPicture.asset(
                    "assets/svg/Group 34844.svg",
                    height: 36,
                    width: 36,
                  )),
              Positioned(
                left: 0,
                bottom: 75,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 1.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColor.blue
                                  : Colors.white)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  // Equal margins on both sides
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Adjusted to space between widgets
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          margin: const EdgeInsets.only(right: 6.0),
                          // Adjust vertical margin if needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[100],
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.edit_location_alt_outlined),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Dehradun",
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              // Add space here (adjust the value as needed)
                              Icon(Icons.edit_location_alt_outlined),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        margin: const EdgeInsets.only(left: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[100],
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/Search.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
