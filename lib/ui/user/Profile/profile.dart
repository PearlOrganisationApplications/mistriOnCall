import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mistrioncall/utils/common_widgets/reusable_text.dart';

import '../../../src/routes/Routes.dart';
import '../../../utils/constants/AppColor.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.scaffold,
        appBar: AppBar(
          backgroundColor: AppColor.blue, // Change the background color
          title: const Text(
            'Profile',
            style: TextStyle(
                color: Colors.white, // Change the text color
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: "WorkSans" // Change the text size
                ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white, // Change the back icon color
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.baseClass);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        // Circular Image
                        const CircleAvatar(
                          radius: 54.0, // Adjust the radius as needed
                          backgroundImage: AssetImage(
                              'assets/images/Image.png'), // Replace with your image path
                        ),

                        // Edit Icon
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.blue,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0, // specify the border width here
                              ),
                            ),
                            child: IconButton(
                              icon: SvgPicture.asset(
                                'assets/svg/Edit.svg',
                                height: 20.h,
                                width: 20.h,
                              ),
                              onPressed: () {
                                // Handle edit button click
                                // You can show a dialog or navigate to an edit screen
                                print('Edit button clicked!');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Annie",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "WorkSans",
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      "Annie@gmail.com",
                      style: TextStyle(
                          color: AppColor.textGrey,
                          fontFamily: "WorkSans",
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.transparent,
                margin: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                // Adjust the value as needed
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusableText(
                      'General',
                      textStyle: TextStyle(
                          color: AppColor.blue,
                          fontFamily: "WorkSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        // Circular Image
                        const CircleAvatar(
                          radius: 54.0, // Adjust the radius as needed
                          backgroundImage: AssetImage(
                              'assets/images/Image.png'), // Replace with your image path
                        ),

                        // Edit Icon
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.blue,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0, // specify the border width here
                              ),
                            ),
                            child: IconButton(
                              icon: SvgPicture.asset(
                                'assets/svg/Edit.svg',
                                height: 20.h,
                                width: 20.h,
                              ),
                              onPressed: () {
                                // Handle edit button click
                                // You can show a dialog or navigate to an edit screen
                                print('Edit button clicked!');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Annie",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "WorkSans",
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      "Annie@gmail.com",
                      style: TextStyle(
                          color: AppColor.textGrey,
                          fontFamily: "WorkSans",
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
