import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/features/user/user_profile/widget/u_profile_textfield.dart';

import 'package:idaawee/utils/constants/font_manager.dart';

// ignore: must_be_immutable
class DEditableSection extends StatelessWidget {
  DEditableSection({super.key});

  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var streetController = TextEditingController();
  var cityController = TextEditingController();
  var numberController = TextEditingController();
  var postCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 18, left: 30, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    contactDetails,
                    style: getBoldStyle(
                        color: MyColors.black, fontSize: MyFonts.size16),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      done.toLowerCase(),
                      style: getBoldStyle(
                          color: MyColors.appColor, fontSize: MyFonts.size10),
                    ),
                  ),
                ],
              ),
              padding20,
              UProfileTextField(
                  controller: emailController,
                  hintText: emailAddress,
                  labelText: emailAddress),
              padding10,
              UProfileTextField(
                  controller: phoneController,
                  hintText: phoneNumber,
                  labelText: phoneNumber),
              padding24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    deliveryDetails,
                    style: getBoldStyle(
                        color: MyColors.black, fontSize: MyFonts.size16),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      done.toLowerCase(),
                      style: getBoldStyle(
                          color: MyColors.appColor, fontSize: MyFonts.size10),
                    ),
                  ),
                ],
              ),
              padding20,
              UProfileTextField(
                  controller: firstNameController,
                  hintText: firstName,
                  labelText: firstName),
              padding10,
              UProfileTextField(
                  controller: lastNameController,
                  hintText: lastName,
                  labelText: lastName),
              padding10,
              UProfileTextField(
                  controller: streetController,
                  hintText: street,
                  labelText: street),
              padding10,
              UProfileTextField(
                  controller: numberController,
                  hintText: number,
                  labelText: number),
              padding10,
              UProfileTextField(
                  controller: cityController,
                  hintText: townCity,
                  labelText: townCity),
              padding10,
              UProfileTextField(
                  controller: postCodeController,
                  hintText: postCode,
                  labelText: postCode),
              padding64,
            ],
          ),
        ),
        CustomButton(
          onPressed: () {},
          buttonText: saveEdits,
          backColor: MyColors.appColor,
          borderRadius: 10.r,
          textStyle:
              getBoldStyle(color: MyColors.white, fontSize: MyFonts.size22),
        ),
      ],
    );
  }
}
