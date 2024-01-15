import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mistrioncall/utils/constants/AppColor.dart';

import '../../ui/Provider/bottomnavigation.dart';
import '../../ui/user/Profile/profile.dart';
import '../../ui/user/category/Category.dart';
import '../../ui/user/home/home.dart';
import '../constants/CommonFunctions.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Home(),
    Category(),
    Category(),
    ProfilePage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    CommonFunctions.customTheme(AppColor.blue);
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      AppColor.blue,
                      BlendMode.srcIn,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/Home.svg', // Replace with your SVG file path
                      height: 24,
                      width: 24,
                    ),
                  )
                : SvgPicture.asset(
                    'assets/svg/Home.svg', // Replace with your SVG file path
                    height: 24,
                    width: 24,
                    // Set unselected icon color
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      AppColor.blue,
                      BlendMode.srcIn,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/Ticket.svg', // Replace with your SVG file path
                      height: 24,
                      width: 24,
                    ),
                  )
                : SvgPicture.asset(
                    'assets/svg/Ticket.svg', // Replace with your SVG file path
                    height: 24,
                    width: 24,
                    color: Colors.grey, // Set unselected icon color
                  ),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      AppColor.blue,
                      BlendMode.srcIn,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/Category.svg', // Replace with your SVG file path
                      height: 24,
                      width: 24,
                    ),
                  )
                : SvgPicture.asset(
                    'assets/svg/Category.svg', // Replace with your SVG file path
                    height: 24,
                    width: 24, // Set unselected icon color
                  ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      AppColor.blue,
                      BlendMode.srcIn,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/Chat.svg', // Replace with your SVG file path
                      height: 24,
                      width: 24,
                    ),
                  )
                : SvgPicture.asset(
                    'assets/svg/Chat.svg', // Replace with your SVG file path
                    height: 24,
                    width: 24,
                    // Set unselected icon color
                  ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      AppColor.blue,
                      BlendMode.srcIn,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/Profile.svg', // Replace with your SVG file path
                      height: 24,
                      width: 24,
                    ),
                  )
                : SvgPicture.asset(
                    'assets/svg/Profile.svg', // Replace with your SVG file path
                    height: 24,
                    width: 24,
                    // Set unselected icon color
                  ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
