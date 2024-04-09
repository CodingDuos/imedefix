import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UNotificationAppointmentCard extends StatelessWidget {
  final String date;
  final String timeago;
  final String title;
  final String slelectedDate;
  const UNotificationAppointmentCard(
      {super.key,
      required this.date,
      required this.slelectedDate,
      required this.timeago,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      width: 1.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: MyColors.borderColor, width: 1.w),
          boxShadow: const [
            BoxShadow(
                color: MyColors.borderColor,
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0)
          ],
          color: MyColors.workinghourColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          children: [
            Image.asset(
              'assets/images/img.png',
              height: 64.h,
              width: 64.w,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 233.w,
                      child: RichText(
                          text: TextSpan(
                        text: 'Your appointment with ',
                        style: getMediumStyle(
                            color: MyColors.black, fontSize: MyFonts.size14),
                        children: <TextSpan>[
                          TextSpan(
                            text: title,
                            style: getSemiBoldStyle(
                                color: MyColors.appColor,
                                fontSize: MyFonts.size14),
                          ),
                          TextSpan(
                            text: ' ${slelectedDate}' ' ${timeago}',
                            style: getMediumStyle(
                                color: MyColors.black,
                                fontSize: MyFonts.size12),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
                padding10,
                Text(
                  date,
                  style: getSemiBoldStyle(
                      color: MyColors.grey, fontSize: MyFonts.size12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
