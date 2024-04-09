// ignore_for_file: prefer_const_constructors

import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/features/auth/widgets/doctor_table.dart';

import 'package:idaawee/features/auth/widgets/userRegisterButtomSection.dart';
import 'package:idaawee/providers/user_providers/user_register_provider.dart';

import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../commons/common_widgets/custom_button.dart';

class TabSignIn extends StatefulWidget {
  const TabSignIn({super.key});

  @override
  State<TabSignIn> createState() => _TabSignInState();
}

class _TabSignInState extends State<TabSignIn> {
  bool passObscure = true;
  bool value = false;
  final controller = Get.put(UserRegisterProvider());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserRegisterProvider>(
        init: UserRegisterProvider(),
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    validatorFn: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an usrname ";
                      }
                      return null; // Return null if the validation passes.
                    },
                    leadingIconPath: AppAssets.user,
                    texfieldHeight: 60.h,
                    controller: controller.usernameController.value,
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
                      if (value == null || value.isEmpty) {
                        return "Please enter an email address";
                      } else if (!value.contains("@")) {
                        return "Invalid email address";
                      }
                      return null;
                      // return null; // Return null if the validation passes.
                    },
                    leadingIconPath: AppAssets.email,
                    texfieldHeight: 60.h,
                    controller: controller.emailController.value,
                    hintText: 'Email',
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    obscure: false,
                    label: '',
                    subTitle: '',
                  ),
                  padding10,
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(bottom: 5.h, top: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color:
                              MyColors.loginScreenTextColor.withOpacity(0.16),
                          width: 1.w),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an password";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters long";
                        }
                        return null;
                        // return null;
                      },
                      controller: controller.passwordController.value,
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
                    ),
                  ),
                  padding10,
                  DoctorCalenderTextField(
                    validatorFn: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                      // return null;
                    },
                    leadingIconPath: AppAssets.calender,
                    texfieldHeight: 60.h,
                    controller: controller.dateBorthController.value,
                    hintText: 'Date of Birth',
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    label: '',
                    subTitle: '',
                    //  onTap: () {
                    //   setState(() {
                    //     passObscure = !passObscure;
                    //   });
                    // },
                  ),
                  padding10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          validatorFn: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your date of birth';
                            }
                            return null;
                            // return null;
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
                            onChanged: (CountryCode code) {
                              setState(() {
                                // countryCode = code;
                                // print(countryCode);
                              });
                            },
                            dialogBackgroundColor: Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.5),
                            showCountryOnly: true,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                          texfieldHeight: 60.h,
                          controller: controller.phonenumberController.value,
                          hintText: 'Phone Number',
                          onChanged: (value) {},
                          onFieldSubmitted: (value) {},
                          obscure: passObscure,
                          label: '',
                          subTitle: '',
                          onTap: () {
                            setState(() {
                              passObscure = !passObscure;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: value,
                            side: const BorderSide(
                                color: MyColors.grey, width: 2),
                            checkColor: MyColors.white,
                            focusColor: Colors.white,
                            fillColor: value
                                ? MaterialStateProperty.all(MyColors.appColor)
                                : MaterialStateProperty.all(MyColors.white),

                            //  value:value,
                            onChanged: (val) {
                              setState(() {
                                value = val!;
                              });
                            },
                          ),
                          Text('Agree with ',
                              style: getMediumStyle(
                                  color: MyColors.grey,
                                  fontSize: MyFonts.size16)),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(termsandConditions,
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
                          onPressed: () {
                            //   if (controller.formKey.currentState!.validate()) {
                            controller.userRegister(context);

                            //  Navigator.pushNamed(context, AppRoutes.userMainMenuScreen);
                            // }
                            //  }
                          },
                          buttonText: signup,
                          fontSize: 18,
                          borderRadius: 100.r,
                          backColor: MyColors.appColor,
                        ),
                  const UserRegisterBottomSection(),
                ],
              ),
            ),
          );
        });
  }
}
