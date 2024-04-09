import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/common_button_with_icon.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DProfileTileSection extends StatelessWidget {
  const DProfileTileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.doctorEditProfileScreen);
                  },
                  child: Container(
                    color: MyColors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.profileicon,
                          height: 20.h,
                          width: 16.w,
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        Text(
                          editProfile,
                          style: getRegularStyle(
                              color: MyColors.black, fontSize: MyFonts.size12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.doctorNotificationScreen);
                  },
                  child: Container(
                    color: MyColors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.notification,
                          height: 20.h,
                          width: 16.w,
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        Text(
                          notification,
                          style: getRegularStyle(
                              color: MyColors.black, fontSize: MyFonts.size12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.doctorCheckOutOrderHistory);
                  },
                  child: Container(
                    color: MyColors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.orderdetail,
                          height: 22.h,
                          width: 21.w,
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        Text(
                          orderDetails,
                          style: getRegularStyle(
                              color: MyColors.black, fontSize: MyFonts.size12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        padding127,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: CommonButtonWithIcon(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.loginScreen, (route) => false);
            },
            buttonText: logout,
            icon: AppAssets.logout,
            borderRadius: 10.r,
            backColor: MyColors.appColor,
          ),
        )
      ],
    );
  }
}
