import 'dart:io';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mistri_on_call_new/test.dart';
import 'package:mistri_on_call_new/utils/helper.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyBksshH_PUaQX7HKXBnE1eMpcUEUVYm_ds',
        appId: '1:179838641367:android:6be941755a0368d514bc92',
        messagingSenderId: '179838641367',
        projectId: 'mistrioncal-9de90',
        storageBucket: 'mistrioncal-9de90.firebasestorage.app',   ));
  await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
  );
  Helper.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
    statusBarIconBrightness: Brightness.light,
  ));

  await Get.putAsync(() => SharedPrefsService().init());
  Get.put(AuthController());
  Get.put(BookingService());
  // Get.put(AuthController123());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          theme: ThemeData(
            scaffoldBackgroundColor: secondaryColor,
            primaryColor: primaryColor,
          ),
          getPages: AppRoutes.routes,
          builder: (context, widget) {
            ScreenUtil.init(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        );
      },
    );
  }
}
