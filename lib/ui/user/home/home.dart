import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mistrioncall/utils/constants/AppColor.dart';
import '../../../src/model/Category.dart';
import '../../../utils/common_widgets/bottomNavigationBar.dart';
import '../../../utils/constants/CommonFunctions.dart';

double calculateBottomPadding(BuildContext context, double basePadding) {
  double threshold = 600.0;
  if (MediaQuery.of(context).size.width < threshold) {
    return basePadding * 1.5;
  } else {
    return basePadding;
  }
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'assets/images/hhh.png',
    'assets/images/worker.png',
    'assets/images/hhh.png',
    'assets/images/worker.png',
    'assets/images/hhh.png',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 268,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Container(
                      height: 240,
                      child: CarouselSlider(
                        items: imgList.map((item) {
                          return Container(
                            height: 160,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                item,
                              ),
                              fit: BoxFit.cover,
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
                      bottom: calculateBottomPadding(context, 50),
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
                                vertical: 1.0,
                                horizontal: 1.0,
                              ),
                              decoration: BoxDecoration(
                                shape: _current == entry.key
                                    ? BoxShape.rectangle
                                    : BoxShape.circle,
                                borderRadius: _current == entry.key
                                    ? BorderRadius.circular(8.0)
                                    : null,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColor.blue
                                        : Colors.white)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: calculateBottomPadding(context, 0),
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 4),
                        // Equal margins on both sides
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // Adjusted to space between widgets
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                margin: const EdgeInsets.only(right: 6.0),
                                // Adjust vertical margin if needed
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: AppColor.cardGrey,
                                    // specify your border color here
                                    width: 0.8, // specify the border width here
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/Location.svg',
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(width: 12.0),
                                    const Expanded(
                                      child: TextField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Dehradun",
                                          hintStyle: AppColor.regularTextStyle,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12.0),
                                    // Add space here (adjust the value as needed)
                                    SvgPicture.asset(
                                      'assets/svg/locationSearch.svg',
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              margin: const EdgeInsets.only(left: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                border: Border.all(
                                  color: AppColor.cardGrey,
                                  width: 0.8, // specify the border width here
                                ),
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
              const SizedBox(height: 24),
              Container(
                height: 24,
                margin: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Category",
                      style: AppColor.headingTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "View All",
                        style: AppColor.subTitleTextStyle
                            .copyWith(color: AppColor.textGrey),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                height: MediaQuery.of(context).size.height * 0.35,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    crossAxisCount: 3,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6.0,
                  ),
                  itemCount: categorylist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 4.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColor.cardGrey,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                categorylist[index].imageUrl,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                              height: 34,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  categorylist[index].text,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: "WorkSans",
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 400,
                color: AppColor.cardGrey,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      height: 24,
                      margin: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Services",
                            style: AppColor.headingTextStyle,
                          ),
                          Text(
                            "View All",
                            style: AppColor.subTitleTextStyle
                                .copyWith(color: AppColor.textGrey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 332,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imgList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 280.0,
                            height: 400,
                            // Set the height according to your design
                            margin:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            child: Stack(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage(imgList[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 200,
                                  left: 0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 18,
                                            ),
                                            Icon(Icons.star,
                                                color: Colors.yellow, size: 18),
                                            Icon(Icons.star,
                                                color: Colors.yellow, size: 18),
                                            Icon(Icons.star,
                                                color: Colors.yellow, size: 18),
                                            Icon(Icons.star_half,
                                                color: Colors.yellow, size: 18),
                                            SizedBox(width: 8.0),
                                            Text(
                                              '4.3',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: AppColor.textGrey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          'Painting For Beautiful \nHomes...',
                                          style: TextStyle(
                                            fontFamily: "WordSans",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 18,
                                              backgroundImage: AssetImage(
                                                  'assets/images/workerimage.png'),
                                            ),
                                            SizedBox(width: 8.0),
                                            // Adjust the spacing as needed
                                            Text(
                                              'Wade Warren',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: AppColor.textGrey,
                                                fontFamily: "WordSans",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 16,
                                    left: 16,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 2.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: const Text(
                                        "PAINTING",
                                        style: TextStyle(
                                            color: AppColor.blue,
                                            fontSize: 10,
                                            fontFamily: "Worksans",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                                Positioned(
                                    top: 176,
                                    right: 16,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 3.0),
                                          color: AppColor.blue,
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      child: const Text(
                                        '\$150',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: "Worksans",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                height: 290,
                margin: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    CarouselSlider(
                      items: imgList.map((item) {
                        return Container(
                          height: 170,
                          // margin: const EdgeInsets.symmetric(horizontal: 14.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  item,
                                ),
                                fit: BoxFit.cover,
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
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 1.0,
                              horizontal: 1.0,
                            ),
                            decoration: BoxDecoration(
                              shape: _current == entry.key
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                              borderRadius: _current == entry.key
                                  ? BorderRadius.circular(8.0)
                                  : null,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : AppColor.blue)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.2),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              Container(
                height: 375,
                color: Colors.transparent,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      height: 24,
                      margin: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Featured",
                            style: AppColor.headingTextStyle,
                          ),
                          Text(
                            "View All",
                            style: AppColor.subTitleTextStyle
                                .copyWith(color: AppColor.textGrey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 290,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imgList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 160.0,
                            height: 400,
                            // Set the height according to your design
                            margin: const EdgeInsets.symmetric(horizontal: 6.0),
                            decoration: BoxDecoration(
                                color: AppColor.cardGrey,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: AppColor.cardBorder, width: 0.6)),

                            child: Stack(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage(imgList[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 200,
                                  left: 0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 12,
                                            ),
                                            Icon(Icons.star,
                                                color: Colors.yellow, size: 14),
                                            Icon(Icons.star,
                                                color: Colors.yellow, size: 14),
                                            Icon(Icons.star,
                                                color: Colors.yellow, size: 14),
                                            Icon(Icons.star_half,
                                                color: Colors.yellow, size: 14),
                                            SizedBox(width: 8.0),
                                            Text(
                                              '4.3',
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                color: AppColor.textGrey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          'Fixing TV Wire...',
                                          style: TextStyle(
                                            fontFamily: "WordSans",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 14,
                                              backgroundImage: AssetImage(
                                                  'assets/images/workerimage.png'),
                                            ),
                                            SizedBox(width: 8.0),
                                            // Adjust the spacing as needed
                                            Text(
                                              'Esther Howard',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: AppColor.textGrey,
                                                fontFamily: "WordSans",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 14,
                                    left: 14,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 2.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: const Text(
                                        "FIXING",
                                        style: TextStyle(
                                            color: AppColor.blue,
                                            fontSize: 8,
                                            fontFamily: "Worksans",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                                Positioned(
                                    top: 186,
                                    right: 10,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0, vertical: 2.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 3.0),
                                          color: AppColor.blue,
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      child: const Text(
                                        '\$150',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: "Worksans",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 220,
                color: AppColor.blue,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    SvgPicture.asset(
                      'assets/svg/Stars.svg',
                      height: 48,
                      width: 210,
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "Introducing  Customer Rating",
                      style: TextStyle(
                          fontFamily: "Worksans",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: 140,
                      height: 36,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Center(
                        child: Text(
                          "See Your Rating",
                          style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 14,
                              fontFamily: "Worksans",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
