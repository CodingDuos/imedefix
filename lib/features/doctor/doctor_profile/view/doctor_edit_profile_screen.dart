import 'package:country_code_picker/country_code_picker.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/commons/common_widgets/common_position_picture.dart';

import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';

class DoctorEditProfileScreen extends StatelessWidget {
  const DoctorEditProfileScreen({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 1.sw,
          decoration: const BoxDecoration(
            color: MyColors.lightBg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  padding45,
                  CustomTextField(
                    validatorFn: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    leadingIconPath: AppAssets.user,
                    texfieldHeight: 60.h,
                    controller: TextEditingController(),
                    hintText: 'Username ',
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    obscure: false,
                    label: '',
                    subTitle: '',
                  ),
                  padding10,
                  CustomTextField(
                    validatorFn: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    leadingIconPath: AppAssets.email,
                    texfieldHeight: 60.h,
                    controller: TextEditingController(),
                    hintText: 'Email',
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    obscure: false,
                    label: '',
                    subTitle: '',
                    onTap: () {},
                  ),
                  CustomTextField(
                    validatorFn: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                    leadingIcon: CountryCodePicker(
                      padding: EdgeInsets.only(left: 10.w, top: 6.h),
                      flagWidth: 15,
                      backgroundColor: Colors.red,
                      boxDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: Colors.white,
                      ),
                      barrierColor: Colors.black.withOpacity(0.5),
                      onChanged: (CountryCode code) {},
                      dialogBackgroundColor: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.5),
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    texfieldHeight: 60.h,
                    hintText: 'Phone Number',
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    label: '',
                    subTitle: '',
                    onTap: () {},
                    controller: TextEditingController(),
                    obscure: false,
                  ),
                  CustomTextField(
                    validatorFn: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    leadingIconPath: AppAssets.calender,
                    texfieldHeight: 60.h,
                    controller: TextEditingController(),
                    hintText: 'Date Of Birth ',
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    obscure: false,
                    label: '',
                    subTitle: '',
                  ),
                  padding30,
                  NextButton(
                    back: () {},
                    text: 'Save Changes',
                    onPressed: onPressed,
                    isbackbuton: false,
                  ),
                  padding100,
                  padding100,
                  padding100,
                ],
              ),
            ),
          ),
        ),
        CommonpositionPicture(
          onPressed: () {},
          picturepath: AppAssets.doctorpro,
        )
      ],
    );
  }
}
