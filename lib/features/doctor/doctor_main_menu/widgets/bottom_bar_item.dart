import 'package:idaawee/features/doctor/doctor_main_menu/controller/main_menu_controller.dart';

import 'package:idaawee/features/user/user_main_menu/controller/main_menu_controller.dart';
import '../../../../commons/common_imports/common_libs.dart';

class BottomBarItems extends StatelessWidget {
  const BottomBarItems({
    super.key,
    required this.mainMenuCtr,
    required this.onTap,
    required this.icon,
    required this.index,
    required this.title,
  });

  final DMainMenuController mainMenuCtr;
  final Function() onTap;
  final String icon;
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 70.w,
        height: 47.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon,
                width: 20.w,
                height: 20.h,
                color: mainMenuCtr.index == index
                    ? MyColors.appColor
                    : MyColors.grey),
            Text(
              title,
              style: getSemiBoldStyle(
                  color: mainMenuCtr.index == index
                      ? MyColors.appColor
                      : MyColors.grey),
            )
          ],
        ),
      ),
    );
  }
}
