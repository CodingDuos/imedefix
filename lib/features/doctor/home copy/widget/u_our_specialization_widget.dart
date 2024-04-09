import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/apis_commons.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

// ignore: must_be_immutable
class UOurSpecializationWidget extends ConsumerWidget {
  UOurSpecializationWidget({super.key});

  final List<String> _specialList = [
    'Heart Specialist',
    'Neurologist',
    'Eye Specialist',
    'Dentist',
    'Gynecologist',
    'Orthopedic',
    'Urologist',
    'Otology',
    'Pediatric',
    'Skin Specialist',
    'Gastroenterology',
    'General',
  ];
  final controller = Get.put(UserHomeScreenProvider());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Our Specialization',
                style: getBoldStyle(
                    color: MyColors.black, fontSize: MyFonts.size16),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.userSpecialListScreen);
                },
                child: Text(
                  'See All',
                  style: getBoldStyle(
                      color: MyColors.appColor, fontSize: MyFonts.size16),
                ),
              )
            ],
          ),
          padding10,
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 0.h),
              shrinkWrap: true,
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  crossAxisCount: 3,
                  mainAxisExtent: 113.h),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    String spaialotor = _specialList[index];
                    controller.userSecializationDoctor(spaialotor);
                    await controller.userSecializationDoctor(spaialotor);
                    Navigator.pushNamed(
                        context, AppRoutes.userSpecialListDetailScreen);
                  },
                  child: Column(
                    children: [
                      Container(
                          height: 87.h,
                          width: 108.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/sp${index + 1}.png',
                                fit: BoxFit.contain,
                                height: 56.h,
                                width: 56.w,
                              ),
                            ],
                          )),
                      padding8,
                      Text(
                        _specialList[index],
                        style: getSemiBoldStyle(
                            color: MyColors.black, fontSize: MyFonts.size12),
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
