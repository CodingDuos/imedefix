import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/commons/common_widgets/u_common_record_card.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../../utils/constants/assets_manager.dart';

class UBookAppointmentWidget extends StatelessWidget {
  final String? name;
  final String? image;
  final String? speciality;
  final String? waitTime;
  final String? experince;
  final String? free;
  final String? avilbelTime;
  final VoidCallback? onTap;
  final String? satistied;
  final String? Status;
  final String? qualification;
  final String? Timeto;

  UBookAppointmentWidget(
      {super.key,
      this.Status,
      this.avilbelTime,
      this.Timeto,
      this.experince,
      this.free,
      this.image,
      this.name,
      this.onTap,
      this.qualification,
      this.satistied,
      this.speciality,
      this.waitTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                UCommonRecordCard(
                  patinumOnTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.userPlatinumProviderScreen);
                  },
                  image: 'assets/images/img.png',
                  name: name.toString(),
                  speciality: speciality.toString(),
                  qualification: qualification.toString(),
                  status: AppAssets.silver,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      waitTime.toString(),
                      overflow: TextOverflow.clip,
                      style: getSemiBoldStyle(
                          color: MyColors.appColor, fontSize: MyFonts.size16),
                    ),
                    Text(
                      'wait Time',
                      style: getSemiBoldStyle(
                          color: MyColors.grey, fontSize: MyFonts.size12),
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
                      experince.toString(),
                      overflow: TextOverflow.clip,
                      style: getSemiBoldStyle(
                          color: MyColors.appColor, fontSize: MyFonts.size16),
                    ),
                    Text(
                      'EXPERIENCE',
                      style: getSemiBoldStyle(
                          color: MyColors.grey, fontSize: MyFonts.size12),
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
                      satistied.toString(),
                      overflow: TextOverflow.clip,
                      style: getSemiBoldStyle(
                          color: MyColors.appColor, fontSize: MyFonts.size16),
                    ),
                    Text(
                      'SATISFIED',
                      style: getSemiBoldStyle(
                          color: MyColors.grey, fontSize: MyFonts.size12),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: const Divider(
                color: MyColors.lightgrey,
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'Available:',
                          style: getSemiBoldStyle(
                              color: MyColors.appColor,
                              fontSize: MyFonts.size14),
                          children: [
                        TextSpan(
                            text: '$avilbelTime - $Timeto',
                            style: getSemiBoldStyle(
                                color: MyColors.black,
                                fontSize: MyFonts.size14))
                      ])),
                  RichText(
                      text: TextSpan(
                          text: 'Fee : ',
                          style: getSemiBoldStyle(
                              color: MyColors.appColor,
                              fontSize: MyFonts.size14),
                          children: [
                        TextSpan(
                            text: free,
                            style: getSemiBoldStyle(
                                color: MyColors.black,
                                fontSize: MyFonts.size14))
                      ])),
                ],
              ),
            ),
            padding10,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomButton(
                  onPressed: onTap,
                  buttonText: 'Book Appointment',
                  buttonHeight: 55.h,
                ))
          ],
        ),
      ),
    );
  }
}
