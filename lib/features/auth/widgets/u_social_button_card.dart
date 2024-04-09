import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class USocialButtonCard extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  // final isloading;
  const USocialButtonCard(
      {super.key,
      // this.isloading,
      required this.image,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 54.h,
        width: 160.w,
        decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(color: MyColors.lightgrey, width: 1),
            boxShadow: [
              BoxShadow(
                color: MyColors.black.withOpacity(0.02),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 18.17.h,
              width: 18.17.w,
            ),
            padding10,
            // isloading == false
            Text(
              text,
              style: getLightStyle(
                color: MyColors.loginScreenTextColor,
                fontSize: MyFonts.size16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
