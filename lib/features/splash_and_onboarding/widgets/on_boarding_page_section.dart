import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/features/splash_and_onboarding/controller/onboarding_controller.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class OnboardingPageSection extends ConsumerWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPageSection({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider.notifier).state;
    return Container(
      height: 1.h,
      width: 1.sw,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            MyColors.appColor1,
            MyColors.appColor,
          ])),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 300.h),
              child: Text(
                'IMEDFIX',
                style: getBoldStyle(
                  color: MyColors.white.withOpacity(0.1),
                  fontSize: MyFonts.size87,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(AppAssets.bgGradient),
          ),
          Positioned(
            top: 90.h,
            right: 10,
            left: (MediaQuery.of(context).size.width - 395.w) /
                2, // Center horizontally
            child: Container(
              margin: EdgeInsets.only(top: 30.w),
              alignment: Alignment.center,
              height: 450.h,
              width: 345.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 300.h,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.black.withOpacity(0.1),
                      blurRadius: 3,
                      spreadRadius: 6,
                      offset: const Offset(3, 3),
                    )
                  ],
                  color: MyColors.appColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 298.h,
                    width: 1.sw,
                    decoration: const BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 36, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          padding16,
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: getBoldStyle(
                                color: MyColors.black,
                                fontSize: MyFonts.size24),
                          ),
                          padding10,
                          Text(subtitle,
                              textAlign: TextAlign.center,
                              style: getSemiBoldStyle(
                                color: MyColors.grey,
                                fontSize: MyFonts.size12,
                              )),
                          padding30,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 3; i++)
                                Container(
                                    margin: const EdgeInsets.all(2),
                                    width: state == i ? 38.w : 20.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      gradient: state == i
                                          ? const LinearGradient(colors: [
                                              MyColors.appColor,
                                              MyColors.appColor1
                                            ])
                                          : null,
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                      color: state == i
                                          ? MyColors.appColor
                                          : MyColors.dotColor,
                                    ))
                            ],
                          ),
                          padding30
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 60.h,
            right: 20.w,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.accountType);
              },
              child: Container(
                  height: 35.h,
                  width: 98.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(width: 1, color: MyColors.white),
                    color: MyColors.white.withOpacity(0.4),
                  ),
                  child: Center(
                    child: Text(
                      skip,
                      style: getBoldStyle(
                          color: MyColors.white, fontSize: MyFonts.size16),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
