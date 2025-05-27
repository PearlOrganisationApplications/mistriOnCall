import 'package:mistri_on_call_new/constant/app_exports.dart';

Widget commonContainer(Widget title, int count){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
    height: 80.h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.w),
      color: primaryColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       title,
        Container(
          height: 55.h,
          width: 50.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            color: secondaryColor,
          ),

          child: Text(count.toString(),
            style: TextStyle(
              color: primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600
            ),

          ),

        )

      ],
    ),
  );
}