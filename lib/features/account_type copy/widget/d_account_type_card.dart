import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DoctorAccountTypeCard extends StatelessWidget {
  final Function() onTap;
  final int index;
  final int selectIndex;
  final String image;
  final String title;
  final String subTitle;

  const DoctorAccountTypeCard({
    super.key,
    required this.onTap,
    required this.index,
    required this.selectIndex,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 187.h,
        width: 345.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: MyColors.lightgrey,
          border: Border.all(
              color: selectIndex == index
                  ? MyColors.appColor
                  : MyColors.lightgrey),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    title,
                    style: getBoldStyle(
                        color: MyColors.black, fontSize: MyFonts.size18),
                  ),
                ),
                padding10,
                SizedBox(
                  child: SizedBox(
                    width: 175.w,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        subTitle,
                        style: getSemiBoldStyle(
                            color: MyColors.accountTypeTextColor,
                            fontSize: MyFonts.size16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    selectIndex == index
                        ? Colors.grey.withOpacity(0.0)
                        : MyColors.lightgrey,
                    BlendMode.saturation,
                  ),
                  child: Image.asset(
                    image,
                    height: 176.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
