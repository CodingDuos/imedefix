import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DialogConfirmation extends StatelessWidget {
  final Function() onConfirm;
  const DialogConfirmation({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.h,
      width: 335.w,
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: MyColors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Image.asset(
              AppAssets.thanks,
              height: 156.h,
              width: 156.w,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              thankYou,
              style: getMediumStyle(
                  color: MyColors.black94, fontSize: MyFonts.size38),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              yourAppointmentSuccessful,
              style: getRegularStyle(
                  color: MyColors.loginScreenTextColor,
                  fontSize: MyFonts.size20),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              bookeAppointment,
              textAlign: TextAlign.center,
              style: getRegularStyle(
                  color: MyColors.loginScreenTextColor,
                  fontSize: MyFonts.size14),
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(
              onPressed:onConfirm,
              buttonText: 'done',
              buttonHeight: 60.h,
              backColor: MyColors.appColor,
              borderRadius: 10,
              fontSize: MyFonts.size18,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              edityourappointment,
              textAlign: TextAlign.center,
              style: getRegularStyle(
                  color: MyColors.loginScreenTextColor,
                  fontSize: MyFonts.size14),
            ),
          ],
        ),
      ),
    );
  }
}