import 'package:mistri_on_call_new/constant/app_exports.dart';

Widget commonbtn1(
  String btnText,
  double btnTextSize,
  VoidCallback onPressed,
  Color btnBckColor,
  Color btnTextColor, {
  required double btnHeight,
  required double btnWidth,
  required double vertPadding,
  required double horizPadding,
  required double borderRadius,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: btnHeight.h,
      width: btnWidth.w,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: horizPadding.h, horizontal: horizPadding.w),
      // Add some padding for better appearance
      decoration: BoxDecoration(
        color: btnBckColor, // Add a background color
        borderRadius:
            BorderRadius.circular(borderRadius.w), // Add rounded corners
      ),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: btnTextSize.sp,
          color: btnTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget commonbtn2(
    String btnText,
    double btnTextSize,
    VoidCallback onPressed,
    Color btnBckColor,
    Color btnTextColor,
    double btnHeight,
    double btnWidth,
    double vertPadding,
    double horizPadding,
    double borderRadius,
    IconData btnIcon) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: btnHeight.h,
      width: btnWidth.w,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: horizPadding.h, horizontal: horizPadding.w),
      // Add some padding for better appearance
      decoration: BoxDecoration(
        color: btnBckColor, // Add a background color
        borderRadius:
            BorderRadius.circular(borderRadius.w), // Add rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            btnText,
            style: TextStyle(
              fontSize: btnTextSize.sp,
              color: btnTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Icon(
            btnIcon,
            size: 20,
            color: btnTextColor,
          )
        ],
      ),
    ),
  );
}

Widget borderButton(
    String btnText,
    double btnTextSize,
    VoidCallback onPressed,
    Color btnBckColor,
    Color btnTextColor,
    double btnHeight,
    double btnWidth,
    double vertPadding,
    double horizPadding,
    double borderRadius,
    Color borderColor) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: btnHeight.h,
      width: btnWidth.w,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: horizPadding.h, horizontal: horizPadding.w),
      // Add some padding for better appearance
      decoration: BoxDecoration(
          color: btnBckColor, // Add a background color
          borderRadius: BorderRadius.circular(borderRadius.w),
          border: Border.all(
            color: borderColor,
          ) // Add rounded corners
          ),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: btnTextSize.sp,
          color: btnTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget formData(String headName, String textFieldName,
    TextInputType keyboardType, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      commonText2(headName, 13, FontWeight.w500, primaryColor),
      const SizedBox(
        height: 4,
      ),
      textField(textFieldName, lightGrey, keyboardType, controller),
      const SizedBox(
        height: 8,
      ),
    ],
  );
}

Widget submitButton(
    {String? btnText,
    double? btnTextSize,
    VoidCallback? onPressed,
    Color? btnBckColor,
    Color? btnTextColor,
    double? btnHeight,
    double? btnWidth,
    double? vertPadding,
    double? horizPadding,
    double? borderRadius}) {
  return commonbtn1(
      btnText!,
      btnTextSize!,
      onPressed!,
      btnBckColor!,
      btnTextColor!,
      btnHeight: btnHeight!,
      btnWidth: btnWidth!,
      vertPadding: vertPadding!,
      horizPadding: horizPadding!,
      borderRadius: borderRadius!);
}
