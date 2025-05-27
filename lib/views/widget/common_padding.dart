import 'package:mistri_on_call_new/constant/app_exports.dart';

Widget appPadding({
  required Widget child,  required double vertPadding, required double horiPadding
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: vertPadding.h, horizontal: horiPadding.w),
    child: SafeArea(
      child: child,
    ),
  );
}