import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class AppointmentDateTime extends StatelessWidget {
  const AppointmentDateTime(
      {super.key, required this.time, required this.date});

  final String time;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 108.h,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Date & Time',
                style: getBoldStyle(
                    color: MyColors.black, fontSize: MyFonts.size16)),
            padding4,
            Container(
              height: 44.h,
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: MyColors.lightgrey),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: getSemiBoldStyle(
                          color: MyColors.black, fontSize: MyFonts.size14),
                    ),
                    Text(
                      time,
                      style: getSemiBoldStyle(
                          color: MyColors.black, fontSize: MyFonts.size14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
