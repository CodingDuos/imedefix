import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class USpeciallistCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final Function()? onTap;
  const USpeciallistCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 103.w,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE5E9EB)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.asset(
                image,
                height: 76.h,
                width: 72.w,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              title,
              style: getSemiBoldStyle(
                  color: MyColors.textColor, fontSize: MyFonts.size14),
            ),
            Text(
              price,
              style: getMediumStyle(
                  color: MyColors.grey, fontSize: MyFonts.size13),
            ),
            padding3,
            CustomButton(
              onPressed: onTap,
              buttonText: 'Consult now',
              backColor: MyColors.themebBluishGreyColor,
              buttonHeight: 28.h,
              buttonWidth: 60.w,
              borderRadius: 4.r,
              textStyle: getMediumStyle(
                  color: MyColors.whiteColor, fontSize: MyFonts.size12),
            ),
          ],
        ),
      ),
    );
  }
}
