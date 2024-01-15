import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mistrioncall/src/routes/Routes.dart';
import 'package:mistrioncall/ui/Splash/splashscreen.dart';
import 'package:mistrioncall/utils/constants/CommonFunctions.dart';

void main() {
  CommonFunctions.customTheme(Colors.transparent);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 825),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            onGenerateRoute: Routes.generateRoute,
            initialRoute: Routes.splash,
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        });
  }
}
