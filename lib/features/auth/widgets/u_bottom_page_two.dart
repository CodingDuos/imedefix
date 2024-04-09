import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/features/auth/widgets/u_pin_text_field.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UBottomPageTwo extends StatelessWidget {
  final Function() onTap;
  final TextEditingController pin1Controller;
  final TextEditingController pin2Controller;
  final TextEditingController pin3Controller;
  final TextEditingController pin4Controller;
  final ScrollController scrollControlle;

  const UBottomPageTwo(
      {super.key,
      required this.pin1Controller,
      required this.onTap,
      required this.pin2Controller,
      required this.pin3Controller,
      required this.pin4Controller,
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
            fourDigitCode,
            style:
                getMediumStyle(color: MyColors.black, fontSize: MyFonts.size24),
          ),
          padding16,
          Text(
            fourDigitCodeSub,
            style: getRegularStyle(
                color: MyColors.loginScreenTextColor, fontSize: MyFonts.size14),
          ),
          padding32,
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UPinTextField(controller: pin1Controller),
                UPinTextField(controller: pin2Controller),
                UPinTextField(controller: pin3Controller),
                UPinTextField(controller: pin4Controller),
              ],
            ),
          ),
          padding24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              onPressed: onTap,
              buttonText: continu,
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
