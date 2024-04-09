import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/features/user/home/widget/u_appointment_card.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/get_conformAppointment.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class CompleteTabView extends StatelessWidget {
  const CompleteTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetConfromAppointmentProvider(context));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: ListView.builder(
          padding: EdgeInsets.only(top: 10.h),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.ComfromAppopintmentList.length,
          itemBuilder: (context, index) {
            final oppointmentDetails =
                controller.ComfromAppopintmentList[index].appointmentDetails;
            final patientDetails =
                controller.ComfromAppopintmentList[index].patientDetails;
            print("oppointment details  ${patientDetails!.username}");
            print("oppointment details  ${patientDetails!.email}");
            print("oppointment details  ${patientDetails!.id}");
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: 159.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: MyColors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                patientDetails.username,
                                style: getBoldStyle(
                                    color: MyColors.black,
                                    fontSize: MyFonts.size16),
                              ),
                              padding4,
                              Text(
                                patientDetails.email,
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
                                    '11:00 - 12:00 AM',
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
                                    'Monday, May 12',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                              textColor: MyColors.grey,
                              buttonHeight: 38.h,
                              buttonWidth: 137.w,
                              backColor: MyColors.white,
                              borderColor: MyColors.grey.withOpacity(0.6),
                              onPressed: () {},
                              buttonText: 'Cancel'),
                          CustomButton(
                              textColor: MyColors.white,
                              buttonHeight: 38.h,
                              buttonWidth: 137.w,
                              onPressed: () {},
                              buttonText: 'Book Again'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
