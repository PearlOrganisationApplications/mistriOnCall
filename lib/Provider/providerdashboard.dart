import 'package:flutter/material.dart';
import 'package:mistrioncall/Splash/splashscreensec.dart';
import 'package:mistrioncall/Welcome/loginscreen.dart';
import 'package:mistrioncall/constants/AppColor.dart';
import 'package:mistrioncall/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class ProviderDashboard extends StatelessWidget {
  const ProviderDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(
        title: const Text('Home',  style: TextStyle(color: Colors.white)),
    backgroundColor: AppColor.blue,
    actions: [
    IconButton(
    icon: const Icon(Icons.chat, color: Colors.white,),
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
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                 Row(
                   children: [
                     Padding(
                       padding: EdgeInsets.only(top: 8.0,left: 28.0,bottom: 20.0),
                       child: Text(
                         'My Commission : ',
                         style: TextStyle(color: Colors.grey),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(top: 8.0,bottom: 20.0),
                       child: Text(
                         '20',
                         style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(top: 8.0,bottom: 20.0),
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
                      'assets/images/discount.png', // Replace with your image URL
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
                            style: TextStyle(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.bold),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 18.0,left: 8.0),
                          child: Text(
                            'Total Booking: ',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
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
                      'assets/images/discount.png', // Replace with your image URL
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
                        style: TextStyle(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.bold),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 18.0,left: 8.0),
                      child: Text(
                        'Total Services: ',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
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
                      'assets/images/discount.png', // Replace with your image URL
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
                          style: TextStyle(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 18.0,left: 8.0),
                        child: Text(
                          'HandyMan: ',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
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
                        'assets/images/discount.png', // Replace with your image URL
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
                          style: TextStyle(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 18.0,left: 8.0),
                        child: Text(
                          'Total Earning: ',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
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
                        'assets/images/discount.png', // Replace with your image URL
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
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
            height: 260.0,

            child: SimpleBarChart( seriesList: _createSampleData())),



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