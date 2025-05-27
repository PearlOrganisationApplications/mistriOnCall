import 'package:mistri_on_call_new/constant/app_exports.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback onLeadingIconPressed;

  CustomAppBar({
    required this.title,
    required this.leadingIcon,
    required this.onLeadingIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Remove the default leading icon
      centerTitle: true, // Center the title
      title: Text(
        title,
        style: TextStyle(
          color: primaryColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: onLeadingIconPressed,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: thirdColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            leadingIcon,
            color: primaryColor,
            size: 24.r,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}