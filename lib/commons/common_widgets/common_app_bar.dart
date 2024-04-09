// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable, prefer_const_constructors, use_super_parameters, duplicate_ignore
import 'package:get/get.dart';
import 'package:idaawee/commons/common_imports/apis_commons.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/user_main_menu/controller/main_menu_controller.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../routes/route_manager.dart';
import '../../utils/constants/assets_manager.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool? isBackButton;
   CommonAppBar({
    Key? key,
    required this.appBarTitle,
    this.onPressed,
    this.backgroundColor,
    this.isBackButton = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  final controller = Get.put(UserHomeScreenProvider());


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: isBackButton!,
      backgroundColor: const Color(0xff38B698).withOpacity(0.1),
      centerTitle: true,
      title: isBackButton == false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                SizedBox(width: 10),
                Obx(() {
                  if (controller.SpeciicUserDetailsList.isEmpty) {
                    return Text("No details available");
                  } else {
                    final details = controller.SpeciicUserDetailsList.first;
                    return Text(
                      "Hi${details.username}",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    );
                  }
                }),
                Image.asset(
                  AppAssets.hand,
                  height: 16.h,
                  width: 16.h,
                ),
              ],
            )
          : Text(
              appBarTitle,
              style: getSemiBoldStyle(
                  color: MyColors.black94, fontSize: MyFonts.size18),
            ),
      actions: [
        isBackButton == false
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CircleAvatar(
                  radius: 21.h,
                  backgroundColor: MyColors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.notificationScreen);
                    },
                    icon: Stack(
                      children: [
                        Image.asset(
                          AppAssets.notification,
                          width: 20.w,
                          height: 20.h,
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: MyColors.appColor,
                              radius: 4.r,
                            ))
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
