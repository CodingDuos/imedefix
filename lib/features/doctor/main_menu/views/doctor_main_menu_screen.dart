import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/doctor_main_menu/controller/main_menu_controller.dart';

import 'package:idaawee/features/doctor/main_menu/widgets/d_bottom_bar.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';

class DoctorMainMenuScreen extends ConsumerStatefulWidget {
  const DoctorMainMenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<DoctorMainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends ConsumerState<DoctorMainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final dMainMenuCtr = ref.watch(dMainMenuProvider);
    return WillPopScope(
      onWillPop: () async {
        if (dMainMenuCtr.index != 0) {
          dMainMenuCtr.setIndex(0);
          return false;
        } else {
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: IndexedStack(
          children: [dMainMenuCtr.screens[dMainMenuCtr.index]],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dMainMenuCtr.setIndex(1);
          },
          elevation: 0,
          backgroundColor: MyColors.themebBluishGreyColor,
          child: Image.asset(AppAssets.add,
              width: 25.w, height: 25.h, color: MyColors.white),
        ),
        bottomNavigationBar: Theme(
          data:
              Theme.of(context).copyWith(canvasColor: MyColors.bottomBarColor),
          child: BottomAppBar(
            color: MyColors.bottomBarColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.h,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DBottomBarItem(
                    onTap: () {
                      dMainMenuCtr.setIndex(0);
                    },
                    icon: AppAssets.home,
                    index: 0,
                  ),
                  DBottomBarItem(
                    onTap: () {
                      dMainMenuCtr.setIndex(2);
                    },
                    icon: AppAssets.user,
                    index: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
