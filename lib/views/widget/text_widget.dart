import '../../constant/app_exports.dart';


 Widget commonText(String text, double fontSize, Color textColor,  FontWeight fontWeight, TextAlign align){
   return Text(
     text,
     textAlign: align,
     style: TextStyle(
       fontWeight: fontWeight,
       fontSize: fontSize,
       color: textColor,

     ),
   );
 }

 Widget textField (String hintText, Color borderColor, TextInputType keyboardType, TextEditingController controller){
   return  TextFormField(
     controller: controller,
     keyboardType: keyboardType,
     decoration: InputDecoration(
       hintText: hintText,

       hintStyle:   TextStyle(color: borderColor, fontSize: 12), // Hint text color
       enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12.0), // Rounded corners
         borderSide:  BorderSide(
           color: borderColor, // Border color
         ),
       ),
       focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12.0.w), // Rounded corners
         borderSide:  BorderSide(
           color:  borderColor, // Border color when focused
         ),
       ),
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12.0.w), // Rounded corners
       ),
     ),
   );
 }


Widget phonetextField(String hintText, Color borderColor, TextInputType keyboardType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    maxLength: 10, // Restrict to a maximum of 10 characters
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly, // Allow only digits (for phone numbers)
    ],
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: borderColor, fontSize: 12), // Hint text color
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
        borderSide: BorderSide(
          color: borderColor, // Border color
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
        borderSide: BorderSide(
          color: borderColor, // Border color when focused
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
    ),
  );
}

Widget commonText2 (String text, double fontSize, FontWeight fontWeight, Color textColor){
   return Text(
     text,
     style: TextStyle(
       fontSize: fontSize,
       fontWeight: fontWeight,
       color: textColor,
     ),
   );
}

