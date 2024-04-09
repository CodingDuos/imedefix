import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UDoctorDeyailCard extends StatelessWidget {
  const UDoctorDeyailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 265.h,
          width: 1.sw,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 52.h,
                  width: 62.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: MyColors.white.withOpacity(0.4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.dental,
                        height: 26.h,
                        width: 34.w,
                      ),
                    ],
                  ),
                ),
                padding10,
                Text(
                  'Dentist Specialist',
                  style: getSemiBoldStyle(
                      color: MyColors.white, fontSize: MyFonts.size14),
                ),
                padding10,
                Text(
                  'Dr. Darlene Robertson',
                  style: getBoldStyle(
                      color: MyColors.white, fontSize: MyFonts.size20),
                ),
                padding30,
                Container(
                  height: 71.h,
                  width: 157.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: MyColors.white.withOpacity(0.3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.cal,
                            height: 13.h,
                            width: 13.h,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Monday, May 12',
                            style: getSemiBoldStyle(
                                color: MyColors.white,
                                fontSize: MyFonts.size14),
                          )
                        ],
                      ),
                      padding4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.clock,
                            height: 13.h,
                            width: 13.h,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '11:00 - 12:00 AM',
                            style: getSemiBoldStyle(
                                color: MyColors.white,
                                fontSize: MyFonts.size14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/im1.png',
              height: 216.h,
              width: 145.w,
            )),
      ],
    );
  }
}
