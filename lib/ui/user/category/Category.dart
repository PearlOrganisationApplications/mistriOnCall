import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mistrioncall/utils/constants/AppColor.dart';

import '../../../src/model/Category.dart';
import '../../../src/routes/Routes.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.blue, // Change the background color
          title: const Text(
            'Category',
            style: TextStyle(
                color: Colors.white, // Change the text color
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: "WorkSans" // Change the text size
                ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white, // Change the back icon color
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.baseClass);
            },
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0,
            crossAxisCount: 2, // Set crossAxisCount to 2
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: categorylist.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(12.0), // Add margin around each Card
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
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text(
                            categorylist[index].text,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontFamily: "WorkSans",
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
