import 'package:get/get.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/u_platinum_body_session.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UserPlatinumProviderScreen extends StatelessWidget {
  UserPlatinumProviderScreen({super.key});

  final controller = Get.put(UserHomeScreenProvider());

  @override
  Widget build(BuildContext context) {
    final doctorDetails = controller.userSpecificDoctorDetailsList[0];
    return Scaffold(
      body: Container(
        height: 2.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [MyColors.appColor1, MyColors.appColor],
              begin: Alignment.topLeft,
              end: Alignment.topRight),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Image.asset(
                AppAssets.loginBg,
                color: MyColors.white.withOpacity(0.1),
                width: 307.w,
                height: 274.h,
              ),
            ),
            Positioned(
              right: 40.w,
              child: Image.asset(
                AppAssets.bgGradient,
                width: 307.w,
                height: 274.h,
              ),
            ),

            Positioned(
              top: 50.h,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon:
                            const Icon(Icons.arrow_back, color: MyColors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        'Platinum Provider',
                        style: getBoldStyle(
                            color: MyColors.black, fontSize: MyFonts.size16),
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: MyColors.black),
                        onPressed: () {},
                      ),
                    ],
                  )),
            ),
            // main container
            Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: UPlatinumProviderBodySession(
                doctorSpecificDetail: controller.userSpecificDoctorDetailsList,
                D_Id: doctorDetails.sId,
                image: doctorDetails.image,
                name: doctorDetails.name,
                education: doctorDetails.education,
                email: doctorDetails.email,
                specialization: doctorDetails.specialization,
                college: doctorDetails.college,
                aboutself: doctorDetails.aboutself,
                license: doctorDetails.license,
                yearofexperience: doctorDetails.yearofexperience,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 105.h, left: 0.w, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 137.h,
                    width: 157.w,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/img.png'),
                          fit: BoxFit.fill),
                      border: Border.all(color: MyColors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 215.h, right: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: MyColors.appColor,
                        size: 27.h,
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25.h,
                    backgroundColor: MyColors.white,
                    child: Image.asset(
                      AppAssets.star,
                      height: 29.h,
                      width: 29.w,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
