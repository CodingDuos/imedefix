import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DPharmacyPopularUploadPicCard extends StatelessWidget {
  final VoidCallback onTap;
  const DPharmacyPopularUploadPicCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          uploaditempicture,
          style: getSemiBoldStyle(
              color: MyColors.checkboxColor, fontSize: MyFonts.size14),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 154.h,
            width: 154.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: MyColors.loginScreenTextColor.withOpacity(0.16),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(65.0),
                child: Image.asset(
                  AppAssets.add,
                  height: 24,
                  color: MyColors.checkboxColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
