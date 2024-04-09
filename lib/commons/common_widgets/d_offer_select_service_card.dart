import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DOfferSelectServiceCard extends StatelessWidget {
  final String title;
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;
  const DOfferSelectServiceCard(
      {super.key,
      required this.title,
      required this.index,
      required this.selectedIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: MyColors.loginScreenTextColor.withOpacity(0.16),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                height: 18.h,
                width: 18.w,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: selectedIndex == index
                          ? MyColors.appColor
                          : MyColors.checkboxColor,
                      width: 2),
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    AppAssets.ok,
                    color: selectedIndex == index
                        ? MyColors.appColor
                        : Colors.transparent,
                  ),
                )),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: getSemiBoldStyle(
                  color: MyColors.checkboxColor, fontSize: MyFonts.size14),
            )
          ],
        ),
      ),
    );
  }
}
