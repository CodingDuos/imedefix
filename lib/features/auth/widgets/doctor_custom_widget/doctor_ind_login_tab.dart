// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/features/auth/widgets/u_login_welcome_section.dart';
import 'package:idaawee/features/doctor/doctor_main_menu/views/doctor_menu_screen.dart';
import 'package:idaawee/features/doctor/main_menu/views/doctor_main_menu_screen.dart';
import 'package:idaawee/features/user/user_main_menu/views/main_menu_screen.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_login_provider.dart';
import 'package:idaawee/providers/user_providers/user_signIn_provider.dart';
import 'package:idaawee/providers/user_providers/user_register_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:idaawee/utils/utils.dart';

class DoctorIndLoginTab extends StatefulWidget {
  const DoctorIndLoginTab({super.key, required this.isdoctor});
  final isdoctor;

  @override
  State<DoctorIndLoginTab> createState() => _TabLoginState();
}

class _TabLoginState extends State<DoctorIndLoginTab> {
  bool passObscure = true;
  final _formKey = GlobalKey<FormState>();

  final controller = Get.put(DoctorIndLoginProivder());

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              leadingIconPath: AppAssets.user,
              texfieldHeight: 60.h,
              controller: controller.d_ind_email.value,
              hintText: 'Username or Email',
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: '',
              subTitle: '',
              validatorFn: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter an email address";
                } else if (!value.contains("@")) {
                  return "Invalid email address";
                }
                return null; // Return null if the validation passes.
              },
            ),
            padding10,
            Container(
              height: 60,
              margin: EdgeInsets.only(bottom: 5.h, top: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: MyColors.loginScreenTextColor.withOpacity(0.16),
                    width: 1.w),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller: controller.d_ind_password.value,
                obscureText: passObscure,
                style: getMediumStyle(
                    fontSize: MyFonts.size16, color: MyColors.black),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 15, left: 20.w),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        passObscure = !passObscure;
                      });
                    },
                    child: Icon(
                      passObscure ? Icons.visibility_off : Icons.visibility,
                      color: passObscure ? Colors.grey : Colors.black,
                    ),
                  ),
                  prefixIcon: Icon(Icons.key),
                  errorStyle: getRegularStyle(
                      fontSize: MyFonts.size10,
                      color: Theme.of(context).colorScheme.error),
                  hintText: ' password',
                  hintStyle: getSemiBoldStyle(
                      fontSize: MyFonts.size16, color: MyColors.grey),
                  border: InputBorder.none,
                ),
                onFieldSubmitted: (value) {},
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters long";
                  }
                  return null;
                },
              ),
            ),
            padding10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(color: MyColors.grey, width: 2),
                      checkColor: MyColors.white,
                      focusColor: Colors.white,
                      fillColor: value
                          ? MaterialStateProperty.all(MyColors.appColor)
                          : MaterialStateProperty.all(MyColors.white),
                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val!;
                        });
                      },
                    ),
                    Text('Remember me',
                        style: getMediumStyle(
                            color: MyColors.grey, fontSize: MyFonts.size16)),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Text(forgorpassword,
                      style: getMediumStyle(
                          color: MyColors.appColor, fontSize: MyFonts.size16)),
                ),
              ],
            ),
            padding10,
            CustomButton(
              onPressed: () {
                //controller.login(context);
                // controller.doctorIndLogin();
                // controller.userLogin();
                // if (_formKey.currentState!.validate()) {
                if (widget.isdoctor == true) {
                  controller.doctorIndLogin(context);
                } else {
                  Navigator.pushNamed(context, AppRoutes.userMainMenuScreen);
                }
                //  }
              },
              buttonText: login,
              fontSize: 18,
              borderRadius: 100.r,
              backColor: MyColors.appColor,
            ),
            const ULoginBottomSection(),
          ],
        ),
      ),
    );
  }
}
