import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class RecomondedCard extends StatelessWidget {
  const RecomondedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 100.h,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: MyColors.lightgrey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  AppAssets.thumb,
                  height: 18.h,
                  width: 18.w,
                ),
                SizedBox(width: 12.w),
                Text(
                  'I Recommend The Doctor',
                  style: getSemiBoldStyle(
                      color: MyColors.black, fontSize: MyFonts.size14),
                ),
              ],
            ),
            padding10,
            Text(
              '100% satisfied with doctor. She listened very carefully and inquired complete medical history',
              style: getMediumStyle(
                  color: MyColors.grey, fontSize: MyFonts.size14),
            ),
            padding12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Verified Patient',
                  style: getSemiBoldStyle(
                      color: MyColors.appColor, fontSize: MyFonts.size12),
                ),
                Text(
                  '2 days ago',
                  style: getSemiBoldStyle(
                      color: MyColors.black, fontSize: MyFonts.size12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
