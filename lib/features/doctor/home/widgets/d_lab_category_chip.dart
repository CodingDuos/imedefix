import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DLabCategoryChip extends StatelessWidget {
  final String chipText;
  const DLabCategoryChip({Key? key, required this.chipText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      width: chipText.length * 15,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(
          color: MyColors.labCardInnerColor
        )
      ),
      alignment: Alignment.center,
      child: Text(
        chipText,style: getSemiBoldStyle(
          color: MyColors.labCardInnerColor,
        fontSize: MyFonts.size14
      ),),
    );
  }
}
