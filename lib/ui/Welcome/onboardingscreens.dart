import 'package:flutter/material.dart';

import 'loginscreen.dart';
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}



class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    OnboardingPage('Welcome To Mistrioncal', 'Amen minm mohhitt non ddddd ddcvbg sdkkkj sdsscds sskkiiuuujj bbssbbs.', 'assets/images/welcomefirst.png'),
    OnboardingPage('Find Your Service', 'Find your services as per your preferences', 'assets/images/welcomesec.png'),
    OnboardingPage('Book The Appointment', 'Book your services on your own time', 'assets/images/welcomethird.png'),
    OnboardingPage('Payment Gateway', 'Choose the preferable options of payment and get the best service', 'assets/images/welcomefourth.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: _pages,
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: _currentPage == 0
                ? ElevatedButton(
              onPressed: () {
                // Handle "Get Started" button press on the last page
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>LoginScreen() // Replace with your next screen widget
                  ),
                );
                },
              child: Text("Get Started"),
            )
                : TextButton(
              onPressed: () {
                // Handle "Skip" button press on pages other than the last
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(), // Replace with your next screen widget
                  ),
                );              },
              child: Text("Skip"),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: Row(
              children: List.generate(
                _pages.length,
                    (index) => buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == index ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}



class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  OnboardingPage(this.title, this.description, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 80,
          child: Image.asset(
          'assets/images/circle_wel.png',
            width: 300.0,
            height: 550.0,
            fit: BoxFit.cover,
          ),
        ),

        Container(
        width: double.infinity,
        height: double.infinity,
            margin: EdgeInsets.only(left: 20.0), // Adjust the margin value as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(top: 60.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  description,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
              ],
            ),


      ),
    ]);
  }
}