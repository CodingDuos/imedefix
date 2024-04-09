import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_circular_cached_network_image.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DNextAppointmentCard extends StatelessWidget {
  final String patientImageUrl;
  final String patientName;
  final String appointmentTime;
  final VoidCallback onCardTap;
  const DNextAppointmentCard(
      {Key? key,
      required this.patientImageUrl,
      required this.patientName,
      required this.appointmentTime,
      required this.onCardTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      splashColor: MyColors.transparentColor,
      highlightColor: MyColors.transparentColor,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 178.w,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: MyColors.borderColor, width: 1.w),
            color: MyColors.workinghourColor,
            borderRadius: BorderRadius.circular(16.r)),
        padding:
            EdgeInsets.only(top: 22.h, left: 10.w, right: 5.w, bottom: 15.h),
        margin: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 1.w,
                  height: 68.h,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                      color: MyColors.textColor,
                      borderRadius: BorderRadius.circular(2.r)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Video Consultation',
                      style: getMediumStyle(
                          color: MyColors.text2Color, fontSize: MyFonts.size16),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text(
                      'Waiting for Call',
                      style: getMediumStyle(
                          color: MyColors.themebBluishGreyColor,
                          fontSize: MyFonts.size12),
                    ),
                  ],
                )
              ],
            ),
            padding10,
            Row(
              children: [
                CachedCircularNetworkImageWidget(
                  image: patientImageUrl,
                  size: 30,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  patientName,
                  style: getMediumStyle(
                      color: MyColors.textColor, fontSize: MyFonts.size12),
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Container(
              width: 77.w,
              height: 25.h,
              decoration: BoxDecoration(
                  color: MyColors.themeOrangeColor,
                  borderRadius: BorderRadius.circular(30.r)),
              alignment: Alignment.center,
              child: Text(
                appointmentTime,
                style: getMediumStyle(
                    color: MyColors.whiteColor, fontSize: MyFonts.size12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
