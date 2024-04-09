import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/features/auth/widgets/u_social_button_card.dart';
import 'package:idaawee/providers/user_providers/user_signIn_provider.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class ULoginBottomSection extends StatelessWidget {
  const ULoginBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserSignProvider());
    return Column(
      children: [
        padding16,
        Row(
          children: [
            Expanded(
                child: Container(
              height: 1.5.h,
              color: MyColors.lightgrey,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Or Continue With',
                style: getMediumStyle(
                    color: MyColors.grey, fontSize: MyFonts.size14),
              ),
            ),
            Expanded(
                child: Container(
              height: 1.5.h,
              color: MyColors.lightgrey,
            )),
          ],
        ),
        padding20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            USocialButtonCard(
              onTap: () {
                controller.faceBookLogin();
              },
              image: AppAssets.facebook,
              text: facebook,
            ),
            USocialButtonCard(
              // isloading: controller.isLoading.value = true,
              onTap: () {
                controller.userGoogleSigIn(context);
              },
              image: AppAssets.google,
              text: google,
            ),
          ],
        ),
      ],
    );
  }
}
