import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/doctor_main_menu/controller/main_menu_controller.dart';
import 'package:idaawee/features/doctor/doctor_main_menu/widgets/bottom_bar_item.dart';

import 'package:idaawee/features/user/user_main_menu/controller/main_menu_controller.dart';
import 'package:idaawee/pushnotificationservice.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';

class DoctorMainMenuScreenMain extends ConsumerStatefulWidget {
  const DoctorMainMenuScreenMain({
    super.key,
  });

  @override
  ConsumerState<DoctorMainMenuScreenMain> createState() =>
      _MainMenuScreenState();
}

class _MainMenuScreenState extends ConsumerState<DoctorMainMenuScreenMain> {
  @override
  void initState() {
    FirebaseMessaging.onBackgroundMessage(BackgroundHandler);
    PushNotificationService pushNotificationService = PushNotificationService();
    pushNotificationService.initialize(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mainMenuCtr = ref.watch(dMainMenuProvider);
    return WillPopScope(
      onWillPop: () async {
        if (mainMenuCtr.index != 0) {
          mainMenuCtr.setIndex(0);
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
          children: [mainMenuCtr.screens[mainMenuCtr.index]],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          color: MyColors.whiteColor,
          surfaceTintColor: MyColors.white,
          shadowColor: MyColors.black,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomBarItems(
                  title: 'Home',
                  mainMenuCtr: mainMenuCtr,
                  onTap: () {
                    mainMenuCtr.setIndex(0);
                  },
                  icon: AppAssets.home,
                  index: 0,
                ),
                BottomBarItems(
                  title: 'Report',
                  mainMenuCtr: mainMenuCtr,
                  onTap: () {
                    mainMenuCtr.setIndex(1);
                  },
                  icon: AppAssets.report,
                  index: 1,
                ),
                BottomBarItems(
                  title: 'Record',
                  mainMenuCtr: mainMenuCtr,
                  onTap: () {
                    mainMenuCtr.setIndex(3);
                  },
                  icon: AppAssets.record,
                  index: 3,
                ),
                BottomBarItems(
                  title: 'Profile',
                  mainMenuCtr: mainMenuCtr,
                  onTap: () {
                    mainMenuCtr.setIndex(4);
                  },
                  icon: AppAssets.profile,
                  index: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
