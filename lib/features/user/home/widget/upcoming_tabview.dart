// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';

import 'package:idaawee/features/user/home/widget/wating_room_screen.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/conform_oppointment_provider.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/confrom_oppointment_model.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UpcomingTabView extends StatefulWidget {
  final PatientName;
  final sletedDate;
  final String id;
  final ConformOppointmentModel? model;
  final seltedTime;
  final String doctorname;
  final String specialist;
  const UpcomingTabView(
      {super.key,
      required this.id,
      required this.model,
      required this.doctorname,
      required this.specialist,
      required this.PatientName,
      required this.sletedDate,
      required this.seltedTime});

  @override
  State<UpcomingTabView> createState() => _UpcomingTabViewState();
}

class _UpcomingTabViewState extends State<UpcomingTabView> {
  final controller = Get.put(DocotrIndConfromOppointmentProvider());
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            SizedBox(
              height: 0,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 8),
            //   child: Container(
            //     height: 155.h,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(5.r),
            //       color: MyColors.white,
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Column(
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     widget.PatientName,
            //                     style: getBoldStyle(
            //                         color: MyColors.black,
            //                         fontSize: MyFonts.size16),
            //                   ),
            //                   padding4,
            //                   padding4,
            //                   Row(
            //                     children: [
            //                       Image.asset(
            //                         AppAssets.calender,
            //                         height: 13.h,
            //                         width: 13.w,
            //                         color: MyColors.appColor,
            //                       ),
            //                       SizedBox(width: 8.w),
            //                       Text(
            //                         widget.seltedTime,
            //                         style: getMediumStyle(
            //                             color: MyColors.black,
            //                             fontSize: MyFonts.size12),
            //                       ),
            //                       SizedBox(width: 12.w),
            //                       Image.asset(
            //                         AppAssets.clock,
            //                         height: 13.h,
            //                         width: 13.w,
            //                         color: MyColors.appColor,
            //                       ),
            //                       SizedBox(width: 8.w),
            //                       Text(
            //                         widget.sletedDate,
            //                         style: getMediumStyle(
            //                             color: MyColors.black,
            //                             fontSize: MyFonts.size12),
            //                       )
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //           padding20,
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               CustomButton(
            //                   textColor: MyColors.grey,
            //                   buttonHeight: 38.h,
            //                   buttonWidth: 137.w,
            //                   backColor: MyColors.white,
            //                   borderColor: MyColors.grey.withOpacity(0.6),
            //                   onPressed: () {

            //                     controller.doctorCancelprovider(widget.id);
            //                   },
            //                   buttonText: 'Cancel'),
            //               CustomButton(
            //                   textColor: MyColors.white,
            //                   buttonHeight: 38.h,
            //                   buttonWidth: 137.w,
            //                   onPressed: () {
            //                     controller.doctorConformOppointmentprovider(
            //                         widget.model!);
            //                   },
            //                   buttonText: 'Accept'),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: MyColors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. ${widget.doctorname}',
                              style: getBoldStyle(
                                  color: MyColors.black,
                                  fontSize: MyFonts.size16),
                            ),
                            padding4,
                            Text(
                              widget.specialist,
                              style: getSemiBoldStyle(
                                  color: MyColors.grey,
                                  fontSize: MyFonts.size14),
                            ),
                            padding4,
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.calender,
                                  height: 13.h,
                                  width: 13.w,
                                  color: MyColors.appColor,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  widget.seltedTime,
                                  style: getMediumStyle(
                                      color: MyColors.black,
                                      fontSize: MyFonts.size12),
                                ),
                                SizedBox(width: 12.w),
                                Image.asset(
                                  AppAssets.clock,
                                  height: 13.h,
                                  width: 13.w,
                                  color: MyColors.appColor,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  widget.sletedDate,
                                  style: getMediumStyle(
                                      color: MyColors.black,
                                      fontSize: MyFonts.size12),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WaitingRoomScreen(
                                      doctorname: widget.doctorname,
                                      specialist: widget.specialist,
                                      remaingtime: widget.seltedTime,
                                    )));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: screenWidth,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                          gradient: LinearGradient(
                            colors: [
                              MyColors.appColor1,
                              MyColors.appColor,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Text(
                          'Enter Waiting Room',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
