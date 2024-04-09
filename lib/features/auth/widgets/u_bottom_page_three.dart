import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UBottomPageThree extends StatelessWidget {
  final Function() onTap;
  final TextEditingController newPassController;
  final TextEditingController rePassController;
  final ScrollController scrollControlle;

  const UBottomPageThree(
      {super.key,
      required this.newPassController,
      required this.onTap,
      required this.rePassController,
      required this.scrollControlle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        controller: scrollControlle,
        children: [
          Center(
            child: Container(
              height: 5.h,
              width: 130.w,
              decoration: BoxDecoration(
                  color: MyColors.greyBottom,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          padding50,
          Text(
            resetPassword,
            style:
                getMediumStyle(color: MyColors.black, fontSize: MyFonts.size24),
          ),
          padding16,
          Text(
            resetPasswordSub,
            style: getRegularStyle(
                color: MyColors.loginScreenTextColor, fontSize: MyFonts.size14),
          ),
          padding32,
          CustomTextField(
            trailingIconPath: AppAssets.eye,
            texfieldHeight: 54.h,
            controller: newPassController,
            hintText: 'New Password',
            hintColor: MyColors.loginScreenTextColor,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: '',
            subTitle: '',
          ),
          padding10,
          CustomTextField(
            trailingIconPath: AppAssets.eye,
            texfieldHeight: 54.h,
            controller: rePassController,
            hintText: 'Re-enter Password',
            hintColor: MyColors.loginScreenTextColor,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: '',
            subTitle: '',
          ),
          padding24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              onPressed: onTap,
              buttonText: updatepassword,
              fontSize: MyFonts.size18,
              borderRadius: 12.r,
              backColor: MyColors.appColor,
            ),
          ),
        ],
      ),
    );
  }
}
