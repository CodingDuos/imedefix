import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

// ignore: must_be_immutable
class DCategoryRadio extends StatelessWidget {
  final String category;
  final int index;
  final int selectIndex;
  final VoidCallback onTap;
  const DCategoryRadio({
    required this.category,
    required this.index,
    required this.selectIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: Container(
          // height: 30.h,
          // width: selectIndex == index
          //     ? category.length * 16.5.w
          //     : category.length * 14.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: MyColors.lightContainerColor),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.h),
            child: Row(
              children: [
                Row(
                  children: [
                    selectIndex == index
                        ? Container(
                            height: 14.h,
                            width: 14.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: MyColors.appColor),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(1.0),
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: MyColors.appColor,
                              ),
                            ),
                          )
                        : Container(),
                    const SizedBox(width: 5),
                    Text(
                      category,
                      style: getSemiBoldStyle(
                          color: MyColors.accountTypeTextColor,
                          fontSize: MyFonts.size14),
                    )
                  ],
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
