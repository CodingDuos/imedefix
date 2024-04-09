import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UBottomPageOne extends StatefulWidget {
  final Function() onTap;
  final TextEditingController emailController;
  final ScrollController scrollControlle;
  const UBottomPageOne(
      {super.key,
      required this.onTap,
      required this.emailController,
      required this.scrollControlle});

  @override
  State<UBottomPageOne> createState() => _UBottomPageOneState();
}

class _UBottomPageOneState extends State<UBottomPageOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        controller: widget.scrollControlle,
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
            forgorpassword.replaceAll('?', ''),
            style:
                getMediumStyle(color: MyColors.black, fontSize: MyFonts.size24),
          ),
          padding16,
          Text(
            forgotpasswordSub,
            style: getRegularStyle(
                color: MyColors.loginScreenTextColor, fontSize: MyFonts.size14),
          ),
          padding32,
          CustomTextField(
            texfieldHeight: 54.h,
            controller: widget.emailController,
            hintText: 'Email',
            hintColor: MyColors.appColor,
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
              onPressed: widget.onTap,
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
