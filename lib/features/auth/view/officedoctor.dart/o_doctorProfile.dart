// ignore_for_file: camel_case_types, unused_import, unused_local_variable

import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/u_about_tabview.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/u_similar_doctor.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_register_provider.dart';
import 'package:idaawee/providers/doctor_providers/doctor_office_provider/doctor_office_register_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:get/get.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class Office_DoctorProfile extends StatelessWidget {
  Office_DoctorProfile({
    super.key,
  });
  final controller = Get.put(DoctorIndRegisterProvider());
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 1.sw,
          decoration: const BoxDecoration(
            color: MyColors.lightBg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              child: Column(
                children: [
                  padding80,
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Container(
                        width: 1.sw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: Colors.transparent),
                        child: Column(
                          children: [
                            Text(
                              'Dr. Maria Elena',
                              style: getBoldStyle(
                                  color: MyColors.black,
                                  fontSize: MyFonts.size20),
                            ),
                            padding6,
                            Text(
                              'Psychologist, M.B.B.S., F.C.P.S (Psychology)',
                              style: getSemiBoldStyle(
                                  color: MyColors.grey,
                                  fontSize: MyFonts.size14),
                            ),
                            padding6,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Under 15 Min',
                                      style: getSemiBoldStyle(
                                          color: MyColors.appColor,
                                          fontSize: MyFonts.size16),
                                    ),
                                    Text(
                                      'WAIT TIME',
                                      style: getSemiBoldStyle(
                                          color: MyColors.grey,
                                          fontSize: MyFonts.size12),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 43.h,
                                  width: 2.w,
                                  color: MyColors.lightgrey,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '7 Years',
                                      style: getSemiBoldStyle(
                                          color: MyColors.appColor,
                                          fontSize: MyFonts.size16),
                                    ),
                                    Text(
                                      'EXPERIENCE',
                                      style: getSemiBoldStyle(
                                          color: MyColors.grey,
                                          fontSize: MyFonts.size12),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 43.h,
                                  width: 2.w,
                                  color: MyColors.lightgrey,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '98% (452)',
                                      style: getSemiBoldStyle(
                                          color: MyColors.appColor,
                                          fontSize: MyFonts.size16),
                                    ),
                                    Text(
                                      'SATISFIED',
                                      style: getSemiBoldStyle(
                                          color: MyColors.grey,
                                          fontSize: MyFonts.size12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: TabBar(
                                  dividerColor: Colors.grey.shade300,
                                  labelStyle: getBoldStyle(
                                      color: MyColors.appColor,
                                      fontSize: MyFonts.size15),
                                  unselectedLabelStyle: getBoldStyle(
                                      color: MyColors.grey,
                                      fontSize: MyFonts.size15),
                                  labelColor: MyColors.appColor,
                                  unselectedLabelColor: MyColors.grey,
                                  indicatorColor: MyColors.appColor,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  tabs: const [
                                    Tab(
                                      child: Text(
                                        '         About Me         ',
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        '            Requests            ',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  UAboutDoctorTabview(
                                    isdoctor: true,
                                  ),
                                  Column(
                                    children: [
                                      USimilarDoctor(
                                        isaddingdoctor: true,
                                        name: 'Dr. Berlin Elizerd',
                                        speciality: 'Medicine Specialist',
                                        image: 'assets/images/img.png',
                                        rating: 4.5,
                                        review: '452',
                                        onPress: () {},
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                              onPressed: () {},
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(),
                                                ),
                                                child: const Center(
                                                  child: Text('view More'),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: MaterialButton(
                                              onPressed: () {},
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.red),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Request Reject',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -60,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 137.h,
                width: 140,
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
        )
      ],
    );
  }
}
