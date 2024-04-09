import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/features/auth/widgets/u_social_button_card.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class USignupJustJoinSection extends StatelessWidget {
  const USignupJustJoinSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            justjoin,
            style:
                getMediumStyle(color: MyColors.black, fontSize: MyFonts.size24),
          ),
          padding16,
          Text(
            createAcountToGetStart,
            style: getRegularStyle(
                color: MyColors.loginScreenTextColor, fontSize: MyFonts.size14),
          ),
          padding80,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              USocialButtonCard(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.userMainMenuScreen);
                },
                image: AppAssets.google,
                text: google,
              ),
              USocialButtonCard(
                onTap: () {},
                image: AppAssets.facebook,
                text: facebook,
              )
            ],
          ),
        ],
      ),
    );
  }
}
