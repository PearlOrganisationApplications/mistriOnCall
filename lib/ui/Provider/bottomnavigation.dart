import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:charts_flutter/flutter.dart' as charts;

import '../../utils/constants/AppColor.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate to the new screen based on the selected tab
    switch (index) {
      case 0:
        HomePage();
      case 1:
        ExplorePage();
      case 2:
        ProfilePage();
    }
  }

  final List<Widget> _pages = [
    HomePage(),
    ExplorePage(),
    ProfilePage(),
  ];
}

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
          'Explore Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text(
          'Profile Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColor.blue,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.chat,
              color: Colors.white,
            ),
            onPressed: () {
              // Add your search functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_box, color: Colors.white),
            onPressed: () {
              // Add your settings functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                color: AppColor.lightblue,
                child: Row(
                  children: [
                    const Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.0, left: 28.0),
                              child: Text(
                                'Commission Type : ',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                'Company',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 8.0, left: 28.0, bottom: 20.0),
                              child: Text(
                                'My Commission : ',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 20.0),
                              child: Text(
                                '20',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 20.0),
                              child: Text(
                                '(Fixed)',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Add some spacing between columns

                    Container(
                      margin: const EdgeInsets.only(left: 80.0),
                      width: 40.0,
                      height: 40.0,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/discount.png',
                          // Replace with your image URL
                          width: 2.0, // Set the desired width
                          height: 2.0, // Set the desired height
                          // Set the BoxFit property as needed
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  width: 140,
                  height: 80,
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Text(
                              '98',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18.0, left: 8.0),
                            child: Text(
                              'Total Booking: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      // Add some spacing between columns

                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        width: 16.0,
                        height: 16.0,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/discount.png',
                            // Replace with your image URL
                            width: 2.0, // Set the desired width
                            height: 2.0, // Set the desired height
                            // Set the BoxFit property as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  width: 140,
                  height: 80,
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Text(
                              '15',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18.0, left: 8.0),
                            child: Text(
                              'Total Services: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      // Add some spacing between columns

                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        width: 16.0,
                        height: 16.0,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/discount.png',
                            // Replace with your image URL
                            width: 2.0, // Set the desired width
                            height: 2.0, // Set the desired height
                            // Set the BoxFit property as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  width: 140,
                  height: 80,
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Text(
                              '30',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18.0, left: 8.0),
                            child: Text(
                              'HandyMan: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      // Add some spacing between columns

                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        width: 16.0,
                        height: 16.0,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/discount.png',
                            // Replace with your image URL
                            width: 2.0, // Set the desired width
                            height: 2.0, // Set the desired height
                            // Set the BoxFit property as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  width: 140,
                  height: 80,
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Text(
                              '45.3',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18.0, left: 8.0),
                            child: Text(
                              'Total Earning: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      // Add some spacing between columns

                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        width: 16.0,
                        height: 16.0,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/discount.png',
                            // Replace with your image URL
                            width: 2.0, // Set the desired width
                            height: 2.0, // Set the desired height
                            // Set the BoxFit property as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Monthly Revenue USD',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                height: 260.0,
                child: SimpleBarChart(seriesList: _createSampleData())),
            const SizedBox(height: 20.0),
            Container(
              color: AppColor.lightblue, // Set your desired background color
              padding: EdgeInsets.all(16.0), // Adjust padding as needed
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Handyman',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold), // Set text color
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                        color: Colors.blue, fontSize: 14.0), // Set text color
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              color: AppColor.lightblue,
              // Set your desired background color
              padding: EdgeInsets.only(top: 10.0, bottom: 16.0),
              // Adjust padding as needed

              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 161,
                        height: 180,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/Image.png', // Replace with your image URL
                                  // Set the desired height
                                  // Set the BoxFit property as needed
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 18.0, left: 8.0),
                                  child: Text(
                                    'Rickey Ledner ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20.0),
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20.0),
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            // Add some spacing between columns
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 161,
                        height: 180,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/Image.png', // Replace with your image URL
                                  // Set the desired height
                                  // Set the BoxFit property as needed
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 18.0, left: 8.0),
                                  child: Text(
                                    'Rickey Ledner ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20.0),
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20.0),
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            // Add some spacing between columns
                          ],
                        ),
                      )
                    ]),
                const SizedBox(height: 20.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 161,
                        height: 180,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/Image.png', // Replace with your image URL
                                  // Set the desired height
                                  // Set the BoxFit property as needed
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 18.0, left: 8.0),
                                  child: Text(
                                    'Rickey Ledner ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20.0),
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20.0),
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            // Add some spacing between columns
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 161,
                        height: 180,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/Image.png', // Replace with your image URL
                                  // Set the desired height
                                  // Set the BoxFit property as needed
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 18.0, left: 8.0),
                                  child: Text(
                                    'Rickey Ledner ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20.0),
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20.0),
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/discount.png',
                                              // Replace with your image URL
                                              width: 2.0,
                                              // Set the desired width
                                              height:
                                                  2.0, // Set the desired height
                                              // Set the BoxFit property as needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            // Add some spacing between columns
                          ],
                        ),
                      )
                    ]),
              ]),
            ),
            Container(
              color: AppColor.lightblue, // Set your desired background color
              padding: EdgeInsets.all(16.0), // Adjust padding as needed
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Services',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold), // Set text color
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                        color: Colors.blue, fontSize: 14.0), // Set text color
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              color: AppColor.lightblue,
              // Set your desired background color
              padding: EdgeInsets.only(top: 10.0, bottom: 46.0),
              // Adjust padding as needed

              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 161,
                        height: 214,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                        'assets/images/image_services.png',
                                        // Replace with your image URL
                                        width: 157.0,
                                        height: 100.0,
                                        fit: BoxFit.fill
                                        // Set the desired height
                                        // Set the BoxFit property as needed
                                        ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 88.0, left: 100.0),
                                      // Set the desired margin top
                                      child: Image.asset(
                                        'assets/images/Price.png',
                                        width: 38.0,
                                        height: 24.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 8,
                                      child: Image.asset(
                                          'assets/images/painting.png',
                                          width: 34.0,
                                          height: 14.0,
                                          fit: BoxFit
                                              .fill // Replace with your image URL
                                          // Set the desired height
                                          // Set the BoxFit property as needed
                                          ),
                                    ),
                                  ],
                                ),
                                Row(children: [
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 5,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 8,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 2.0,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 4.0),
                                      child: const Text(
                                        '4.3',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.0),
                                      ))
                                ]),
                                const Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    'Painting For ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    'Beautiful Homes... ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                            'assets/images/image_pr.png',
                                            // Replace with your image URL
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.fill
                                            // Set the desired height
                                            // Set the BoxFit property as needed
                                            ),
                                        Container(
                                            margin: EdgeInsets.only(left: 14.0),
                                            child: const Text(
                                              'Emma Grate',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.0),
                                            )),
                                      ],
                                    )),
                              ],
                            ),
                            // Add some spacing between columns
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 161,
                        height: 214,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                        'assets/images/image_services.png',
                                        // Replace with your image URL
                                        width: 157.0,
                                        height: 100.0,
                                        fit: BoxFit.fill
                                        // Set the desired height
                                        // Set the BoxFit property as needed
                                        ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 88.0, left: 100.0),
                                      // Set the desired margin top
                                      child: Image.asset(
                                        'assets/images/Price.png',
                                        width: 38.0,
                                        height: 24.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 8,
                                      child: Image.asset(
                                          'assets/images/painting.png',
                                          width: 34.0,
                                          height: 14.0,
                                          fit: BoxFit
                                              .fill // Replace with your image URL
                                          // Set the desired height
                                          // Set the BoxFit property as needed
                                          ),
                                    ),
                                  ],
                                ),
                                Row(children: [
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 5,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 8,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 2.0,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 4.0),
                                      child: const Text(
                                        '4.3',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.0),
                                      ))
                                ]),
                                const Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    'Painting For ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    'Beautiful Homes... ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                            'assets/images/image_pr.png',
                                            // Replace with your image URL
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.fill
                                            // Set the desired height
                                            // Set the BoxFit property as needed
                                            ),
                                        Container(
                                            margin: EdgeInsets.only(left: 14.0),
                                            child: const Text(
                                              'Emma Grate',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.0),
                                            )),
                                      ],
                                    )),
                              ],
                            ),
                            // Add some spacing between columns
                          ],
                        ),
                      ),
                    ]),
                const SizedBox(height: 20.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 161,
                        height: 214,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                        'assets/images/image_services.png',
                                        // Replace with your image URL
                                        width: 157.0,
                                        height: 100.0,
                                        fit: BoxFit.fill
                                        // Set the desired height
                                        // Set the BoxFit property as needed
                                        ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 88.0, left: 100.0),
                                      // Set the desired margin top
                                      child: Image.asset(
                                        'assets/images/Price.png',
                                        width: 38.0,
                                        height: 24.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 8,
                                      child: Image.asset(
                                          'assets/images/painting.png',
                                          width: 34.0,
                                          height: 14.0,
                                          fit: BoxFit
                                              .fill // Replace with your image URL
                                          // Set the desired height
                                          // Set the BoxFit property as needed
                                          ),
                                    ),
                                  ],
                                ),
                                Row(children: [
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 5,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 8,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 2.0,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 4.0),
                                      child: const Text(
                                        '4.3',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.0),
                                      ))
                                ]),
                                const Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    'Painting For ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    'Beautiful Homes... ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                            'assets/images/image_pr.png',
                                            // Replace with your image URL
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.fill
                                            // Set the desired height
                                            // Set the BoxFit property as needed
                                            ),
                                        Container(
                                            margin: EdgeInsets.only(left: 14.0),
                                            child: const Text(
                                              'Emma Grate',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.0),
                                            )),
                                      ],
                                    )),
                              ],
                            ),
                            // Add some spacing between columns
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 161,
                        height: 214,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                        'assets/images/image_services.png',
                                        // Replace with your image URL
                                        width: 157.0,
                                        height: 100.0,
                                        fit: BoxFit.fill
                                        // Set the desired height
                                        // Set the BoxFit property as needed
                                        ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 88.0, left: 100.0),
                                      // Set the desired margin top
                                      child: Image.asset(
                                        'assets/images/Price.png',
                                        width: 38.0,
                                        height: 24.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 8,
                                      child: Image.asset(
                                          'assets/images/painting.png',
                                          width: 34.0,
                                          height: 14.0,
                                          fit: BoxFit
                                              .fill // Replace with your image URL
                                          // Set the desired height
                                          // Set the BoxFit property as needed
                                          ),
                                    ),
                                  ],
                                ),
                                Row(children: [
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 5,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 8,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 2.0,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 4.0),
                                      child: const Text(
                                        '4.3',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.0),
                                      ))
                                ]),
                                const Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    'Painting For ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    'Beautiful Homes... ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                            'assets/images/image_pr.png',
                                            // Replace with your image URL
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.fill
                                            // Set the desired height
                                            // Set the BoxFit property as needed
                                            ),
                                        Container(
                                            margin: EdgeInsets.only(left: 14.0),
                                            child: const Text(
                                              'Emma Grate',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.0),
                                            )),
                                      ],
                                    )),
                              ],
                            ),
                            // Add some spacing between columns
                          ],
                        ),
                      ),
                    ]),
                const SizedBox(height: 20.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 161,
                        height: 214,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                        'assets/images/image_services.png',
                                        // Replace with your image URL
                                        width: 157.0,
                                        height: 100.0,
                                        fit: BoxFit.fill
                                        // Set the desired height
                                        // Set the BoxFit property as needed
                                        ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 88.0, left: 100.0),
                                      // Set the desired margin top
                                      child: Image.asset(
                                        'assets/images/Price.png',
                                        width: 38.0,
                                        height: 24.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 8,
                                      child: Image.asset(
                                          'assets/images/painting.png',
                                          width: 34.0,
                                          height: 14.0,
                                          fit: BoxFit
                                              .fill // Replace with your image URL
                                          // Set the desired height
                                          // Set the BoxFit property as needed
                                          ),
                                    ),
                                  ],
                                ),
                                Row(children: [
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 5,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 8,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 2.0,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 4.0),
                                      child: const Text(
                                        '4.3',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.0),
                                      ))
                                ]),
                                const Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    'Painting For ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    'Beautiful Homes... ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                            'assets/images/image_pr.png',
                                            // Replace with your image URL
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.fill
                                            // Set the desired height
                                            // Set the BoxFit property as needed
                                            ),
                                        Container(
                                            margin: EdgeInsets.only(left: 14.0),
                                            child: const Text(
                                              'Emma Grate',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.0),
                                            )),
                                      ],
                                    )),
                              ],
                            ),
                            // Add some spacing between columns
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 161,
                        height: 214,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                        'assets/images/image_services.png',
                                        // Replace with your image URL
                                        width: 157.0,
                                        height: 100.0,
                                        fit: BoxFit.fill
                                        // Set the desired height
                                        // Set the BoxFit property as needed
                                        ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 88.0, left: 100.0),
                                      // Set the desired margin top
                                      child: Image.asset(
                                        'assets/images/Price.png',
                                        width: 38.0,
                                        height: 24.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 8,
                                      child: Image.asset(
                                          'assets/images/painting.png',
                                          width: 34.0,
                                          height: 14.0,
                                          fit: BoxFit
                                              .fill // Replace with your image URL
                                          // Set the desired height
                                          // Set the BoxFit property as needed
                                          ),
                                    ),
                                  ],
                                ),
                                Row(children: [
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 5,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 8,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 2.0,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 4.0),
                                      child: const Text(
                                        '4.3',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.0),
                                      ))
                                ]),
                                const Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    'Painting For ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    'Beautiful Homes... ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                            'assets/images/image_pr.png',
                                            // Replace with your image URL
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.fill
                                            // Set the desired height
                                            // Set the BoxFit property as needed
                                            ),
                                        Container(
                                            margin: EdgeInsets.only(left: 14.0),
                                            child: const Text(
                                              'Emma Grate',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.0),
                                            )),
                                      ],
                                    )),
                              ],
                            ),
                            // Add some spacing between columns
                          ],
                        ),
                      ),
                    ]),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<OrdinalSales, String>> seriesList;

  SimpleBarChart({Key? key, required this.seriesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: true, // You can enable or disable animations based on your needs
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

List<charts.Series<OrdinalSales, String>> _createSampleData() {
  final data = [
    OrdinalSales('Jan', 5000),
    OrdinalSales('Feb', 2500),
    OrdinalSales('Mar', 10000),
    OrdinalSales('Apr', 75),
    OrdinalSales('May', 75),
    OrdinalSales('Jun', 75),
    OrdinalSales('Jul', 75),
    OrdinalSales('Aug', 75),
    OrdinalSales('Sep', 75),
    OrdinalSales('Oct', 75),
    OrdinalSales('Nov', 75),
    OrdinalSales('Dec', 75),
  ];

  return [
    charts.Series<OrdinalSales, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: data,
    )
  ];
}
