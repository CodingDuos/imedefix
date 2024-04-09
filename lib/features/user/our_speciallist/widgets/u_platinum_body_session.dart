// ignore_for_file: prefer_const_constructors

import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/u_about_tabview.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/u_review_tab.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../../universal_models/doctor_models/doctor_SpecificDetailsModel.dart';

class UPlatinumProviderBodySession extends StatelessWidget {
  final String? D_Id;
  final String? image;
  final String? name;
  final String? email;
  final String? waitTime;
  final List<DoctorSpecificDatailsModel>? doctorSpecificDetail;
  final String? specialization;
  final String? conditionstreated;
  final String? aboutself;
  final String? education;
  final String? college;
  final String? license;

  final String? yearofexperience;

  UPlatinumProviderBodySession(
      {super.key,
      this.aboutself,
      this.waitTime,
      this.doctorSpecificDetail,
      this.college,
      this.conditionstreated,
      this.education,
      this.email,
      this.image,
      this.license,
      this.name,
      this.D_Id,
      this.specialization,
      this.yearofexperience});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Container(
          child: Column(
            children: [
              padding40,
              Expanded(
                child: Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r)),
                    color: MyColors.white.withOpacity(0.9),
                  ),
                  child: Column(
                    children: [
                      padding80,
                      Text(
                        name.toString(),
                        style: getBoldStyle(
                            color: MyColors.black, fontSize: MyFonts.size20),
                      ),
                      padding6,
                      Text(
                        specialization.toString(),
                        style: getSemiBoldStyle(
                            color: MyColors.grey, fontSize: MyFonts.size14),
                      ),
                      padding6,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                waitTime.toString(),
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
                                yearofexperience.toString(),
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
                                color: MyColors.grey, fontSize: MyFonts.size15),
                            labelColor: MyColors.appColor,
                            unselectedLabelColor: MyColors.grey,
                            indicatorColor: MyColors.appColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: const [
                              Tab(
                                child: Text(
                                  '         About Doctor         ',
                                ),
                              ),
                              Tab(
                                child: Text(
                                  '            Reviews            ',
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
                              doctorSpecificDetail: doctorSpecificDetail,
                              specialization: specialization,
                              education: education,
                              aboutself: aboutself,
                              conditionstreated: conditionstreated,
                              isdoctor: false,
                            ),
                            UReviewTabview(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
