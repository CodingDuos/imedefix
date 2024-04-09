import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UAppointmentCard extends StatelessWidget {
  final VoidCallback? cancel;
  final VoidCallback? reschedule;
  final VoidCallback? addReview;
  final VoidCallback? bookAgain;
  final VoidCallback? cancelationReason;
  const UAppointmentCard(
      {super.key,
      this.cancel,
      this.reschedule,
      this.addReview,
      this.bookAgain,
      this.cancelationReason});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      'Dr. Maria Elena',
                      style: getBoldStyle(
                          color: MyColors.black, fontSize: MyFonts.size16),
                    ),
                    padding4,
                    Text(
                      'Psychologist',
                      style: getSemiBoldStyle(
                          color: MyColors.grey, fontSize: MyFonts.size14),
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
                              color: MyColors.black, fontSize: MyFonts.size12),
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
                              color: MyColors.black, fontSize: MyFonts.size12),
                        )
                      ],
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.asset(
                    'assets/images/img.png',
                    height: 72.h,
                    width: 72.w,
                  ),
                ),
              ],
            ),
            padding4,
            cancelationReason == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          textColor: MyColors.grey,
                          buttonHeight: 38.h,
                          buttonWidth: 157.w,
                          backColor: MyColors.white,
                          borderColor: MyColors.grey.withOpacity(0.6),
                          onPressed: () {},
                          buttonText: cancel != null ? 'Cancel' : 'Add Review'),
                      CustomButton(
                          textColor: MyColors.white,
                          buttonHeight: 38.h,
                          buttonWidth: 157.w,
                          onPressed: () {},
                          buttonText:
                              reschedule != null ? 'Reschedule' : 'Book Again'),
                    ],
                  )
                : CustomButton(
                    textColor: MyColors.grey,
                    buttonHeight: 38.h,
                    buttonWidth: 322.w,
                    backColor: MyColors.white,
                    borderColor: MyColors.grey.withOpacity(0.6),
                    onPressed: () {},
                    buttonText: 'Cancellation Reason'),
          ],
        ),
      ),
    );
  }
}
