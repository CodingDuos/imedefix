import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idaawee/features/doctor/doctor_main_menu/controller/main_menu_controller.dart';

import '../../../../commons/common_imports/common_libs.dart';

class DBottomBarItem extends ConsumerWidget {
  const DBottomBarItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.index,
  });
  final Function() onTap;
  final String icon;
  final int index;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final dMainMenuCtr = ref.watch(dMainMenuProvider);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 70.w,
        height: 40.h,
        color: MyColors.bottomBarColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon,
                width: 25.w,
                height: 25.h,
                color: dMainMenuCtr.index == index
                    ? MyColors.themebBluishGreyColor
                    : MyColors.grey),
          ],
        ),
      ),
    );
  }
}
