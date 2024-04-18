// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_register_provider.dart';

import 'package:idaawee/universal_models/doctor_models/doctor_SpecificDetailsModel.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UAboutDoctorTabview extends StatelessWidget {
  final String? specialization;
  final String? conditionstreated;
  final String? aboutself;
  final String? education;
  final List<DoctorSpecificDatailsModel>? doctorSpecificDetail;
  UAboutDoctorTabview(
      {Key? key,
      this.isdoctor = false,
      this.aboutself,
      this.conditionstreated,
      this.education,
      this.doctorSpecificDetail,
      this.specialization})
      : super(key: key);
  final bool isdoctor;

  final contoller = Get.put(DoctorIndRegisterProvider());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white54,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        aboutself.toString(),
                        style: getMediumStyle(
                            color: MyColors.grey, fontSize: MyFonts.size14),
                      ),
                      padding10,
                      Text(
                        'Specialization',
                        style: getSemiBoldStyle(
                            color: MyColors.black, fontSize: MyFonts.size18),
                      ),
                      padding10,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 2.5.h,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              specialization.toString(),
                              style: getMediumStyle(
                                  color: MyColors.grey,
                                  fontSize: MyFonts.size14),
                            ),
                          ),
                        ],
                      ),
                      padding10,
                      Text(
                        'Education',
                        style: getSemiBoldStyle(
                            color: MyColors.black, fontSize: MyFonts.size18),
                      ),
                      padding10,
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 12.w),
                              CircleAvatar(
                                radius: 2.5.h,
                              ),
                              SizedBox(width: 8.w),
                              SizedBox(
                                width: 250.w,
                                child: Text(
                                  education.toString(),
                                  style: getMediumStyle(
                                      color: MyColors.grey,
                                      fontSize: MyFonts.size14),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      padding10,
                      Text(
                        'Conditions Treated',
                        style: getSemiBoldStyle(
                            color: MyColors.black, fontSize: MyFonts.size18),
                      ),
                      padding10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 2.5.h,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                conditionstreated.toString(),
                                style: getMediumStyle(
                                    color: MyColors.grey,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 2.5.h,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                conditionstreated.toString(),
                                style: getMediumStyle(
                                    color: MyColors.grey,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
                          ),
                          Container(
                            width: 45.w,
                          ),
                        ],
                      ),
                      padding10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 2.5.h,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Ectopic Pregnancy',
                                style: getMediumStyle(
                                    color: MyColors.grey,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 2.5.h,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Endometriosis',
                                style: getMediumStyle(
                                    color: MyColors.grey,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              NextButton(
                text: 'Next',
                back: () {},
                onPressed: () {
                  print('object khan mashwani');
                  contoller.doctorIndRegister(context);
                },
                isbackbuton: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
