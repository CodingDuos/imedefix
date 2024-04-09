// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';

import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/features/auth/widgets/u_login_welcome_section.dart';
import 'package:idaawee/providers/user_providers/user_signIn_provider.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../commons/common_widgets/custom_button.dart';

class TabLogin extends StatefulWidget {
  const TabLogin({super.key, required this.isdoctor});
  final isdoctor;

  @override
  State<TabLogin> createState() => _TabLoginState();
}

class _TabLoginState extends State<TabLogin> {
  bool passObscure = true;
  bool isLoading = false;

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserSignProvider>(
        init: UserSignProvider(),
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        leadingIconPath: AppAssets.user,
                        texfieldHeight: 60.h,
                        controller: controller.emailController.value,
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
                              color: MyColors.loginScreenTextColor
                                  .withOpacity(0.16),
                              width: 1.w),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: TextFormField(
                          controller: controller.passwordController.value,
                          obscureText: passObscure,
                          style: getMediumStyle(
                              fontSize: MyFonts.size16, color: MyColors.black),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: 15, left: 20.w),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  passObscure = !passObscure;
                                });
                              },
                              child: Icon(
                                passObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
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
                                side: const BorderSide(
                                    color: MyColors.grey, width: 2),
                                checkColor: MyColors.white,
                                focusColor: Colors.white,
                                fillColor: value
                                    ? MaterialStateProperty.all(
                                        MyColors.appColor)
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
                                      color: MyColors.grey,
                                      fontSize: MyFonts.size16)),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(forgorpassword,
                                style: getMediumStyle(
                                    color: MyColors.appColor,
                                    fontSize: MyFonts.size16)),
                          ),
                        ],
                      ),
                      if (controller.errorString.value.isNotEmpty)
                        Text(
                          controller.errorString.value,
                          style: TextStyle(color: Colors.red),
                        ),
                      padding10,
                      controller.isLoading
                          ? Positioned.fill(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : CustomButton(
                              onPressed: () async {
                                controller.userLogin(context);
                              },
                              buttonText: login,
                              fontSize: 18,
                              borderRadius: 100.r,
                              backColor: MyColors.appColor,
                            ),
                      const ULoginBottomSection(),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
