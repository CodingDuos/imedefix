import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class USystemCard extends StatelessWidget {
  final String image;
  const USystemCard({super.key, required this.image});

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
            Container(
              height: 64.h,
              width: 64.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: MyColors.lightgrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    height: 42.h,
                    width: 42.w,
                  ),
                ],
              ),
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
                      child: Text(
                        '\$200 consultation charges are detected from your balance',
                        style: getMediumStyle(
                            color: MyColors.black, fontSize: MyFonts.size14),
                      ),
                    ),
                  ],
                ),
                padding10,
                Text(
                  'July, 24 2023',
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
