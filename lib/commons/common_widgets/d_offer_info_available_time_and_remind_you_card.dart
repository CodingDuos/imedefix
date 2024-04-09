import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DOfferInfoAvailableTimeAndRemindYouCard extends StatelessWidget {
  final String title;
  final bool isMore;
  final bool isRemindYou;
  final VoidCallback? onTap;
  const DOfferInfoAvailableTimeAndRemindYouCard(
      {super.key,
      required this.title,
      required this.isMore,
      this.onTap,
      required this.isRemindYou});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52.h,
        width: isRemindYou
            ? title.length * 12.w.toDouble()
            : isMore == true
                ? title.length * 20.w
                : title.length * 14.w.toDouble(),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
                color: MyColors.loginScreenTextColor.withOpacity(0.16))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 19.h),
          child: isMore == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: getSemiBoldStyle(
                          fontSize: MyFonts.size14,
                          color: MyColors.accountTypeTextColor),
                    ),
                    const Spacer(),
                    RotatedBox(
                        quarterTurns: 1,
                        child: Image.asset(
                          AppAssets.arrowcircleright,
                          height: 18.h,
                          width: 18.w,
                        ))
                  ],
                )
              : Center(
                  child: Text(
                    title,
                    style: getSemiBoldStyle(
                        fontSize: MyFonts.size14,
                        color: MyColors.accountTypeTextColor),
                  ),
                ),
        ),
      ),
    );
  }
}
