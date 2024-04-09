import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/features/auth/widgets/u_login_custom_bottom_sheet_section.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

// ignore: must_be_immutable
class ULoginForgetPasswordSection extends StatelessWidget {
  ULoginForgetPasswordSection({
    super.key,
  });

  var emailController = TextEditingController();
  var pinOneController = TextEditingController();
  var pinTwoController = TextEditingController();
  var pinThreeController = TextEditingController();
  var pinFourController = TextEditingController();
  var newPasswordController = TextEditingController();
  var reEnterPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            displayBottomSheet(context);
          },
          child: Text(forgorpassword,
              style: getRegularStyle(
                  color: MyColors.appColor, fontSize: MyFonts.size14)),
        ),
        padding30,
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.accountType);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nohaveAccount,
                style: getRegularStyle(
                    color: MyColors.appColor, fontSize: MyFonts.size14),
              ),
            ],
          ),
        ),
        padding50,
      ],
    );
  }

  Future displayBottomSheet(BuildContext context) {
    return showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.6,
      maxHeight: 1,
      context: context,
      isExpand: true,
      builder: _buildBottomSheet,
      anchors: [0, 0.5, 1],
      isSafeArea: true,
      bottomSheetBorderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
        child: ULoginCustomBottomSection(
            scrollController: scrollController,
            emailController: emailController,
            pinOneController: pinOneController,
            pinTwoController: pinTwoController,
            pinThreeController: pinThreeController,
            pinFourController: pinFourController,
            newPasswordController: newPasswordController,
            reEnterPasswordController: reEnterPasswordController));
  }
}
