import 'package:idaawee/commons/common_imports/common_libs.dart';

class UCallButtonCard extends StatelessWidget {
  final Color color;
  final Color iconColor;
  final String icon;
  final Function() onTap;
  const UCallButtonCard(
      {super.key,
      required this.color,
      required this.icon,
      required this.iconColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              icon,
              height: 24.h,
              width: 24.w,
              color: iconColor,
            ),
          )),
    );
  }
}