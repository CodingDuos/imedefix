import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/home/views/doctor_home_screen.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_home_provider.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UAllSpecialList extends StatefulWidget {
  const UAllSpecialList({super.key});

  @override
  State<UAllSpecialList> createState() => _UAllSpecialListState();
}

final controller = Get.put(UserHomeScreenProvider());
final doctorcontroller = Get.put(DoctorIndHomeProvider());

class _UAllSpecialListState extends State<UAllSpecialList> {
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 15.h),
          shrinkWrap: true,
          itemCount: 12,
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
                        color: MyColors.black, fontSize: MyFonts.size10),
                  )
                ],
              ),
            );
          }),
    );
  }
}
