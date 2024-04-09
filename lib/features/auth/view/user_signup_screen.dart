import 'package:flutter/cupertino.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/commons/common_widgets/common_pass_text_field.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/features/auth/widgets/u_signup_just_join_section.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../commons/common_imports/common_libs.dart';

class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({super.key});

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool termsAndConditions = false;
  bool passObscure = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          height: 1.sh,
          width: 1.sw,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.bgImage), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  padding152,
                  const USignupJustJoinSection(),
                  padding32,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextField(
                      validatorFn: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      texfieldHeight: 54.h,
                      controller: nameController,
                      hintText: 'Name',
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      obscure: false,
                      label: '',
                      subTitle: '',
                    ),
                  ),
                  padding8,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextField(
                      validatorFn: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      texfieldHeight: 54.h,
                      controller: emailController,
                      hintText: 'Email',
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      obscure: false,
                      label: '',
                      subTitle: '',
                    ),
                  ),
                  padding8,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CommonPassTextField(
                      validatorFn: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      tailingIcon: passObscure == false
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  passObscure = !passObscure;
                                });
                              },
                              child: Icon(
                                CupertinoIcons.eye,
                                color: MyColors.black,
                                size: 14.sp,
                              ))
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  passObscure = !passObscure;
                                });
                              },
                              child: Icon(CupertinoIcons.eye_slash,
                                  color: MyColors.themebBluishGreyColor,
                                  size: 14.sp)),
                      texfieldHeight: 54.h,
                      controller: passwordController,
                      hintText: 'Password',
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      obscure: passObscure,
                      label: '',
                      subTitle: '',
                    ),
                  ),
                  padding10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              termsAndConditions = !termsAndConditions;
                            });
                          },
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: termsAndConditions
                                ? MyColors.appColor
                                : MyColors.loginScreenTextColor,
                          ),
                        ),
                        padding10,
                        Text(
                          agreeTo,
                          style: getRegularStyle(
                              color: MyColors.loginScreenTextColor,
                              fontSize: MyFonts.size12),
                        ),
                      ],
                    ),
                  ),
                  padding45,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRoutes.loginScreen, (route) => false);
                        }
                      },
                      buttonText: signup,
                      fontSize: MyFonts.size18,
                      borderRadius: 12.r,
                      backColor: MyColors.appColor,
                    ),
                  ),
                  padding12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        haveAccount,
                        style: getRegularStyle(
                            color: MyColors.loginScreenTextColor,
                            fontSize: MyFonts.size14),
                      ),
                      padding5,
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                AppRoutes.loginScreen, (route) => false);
                          }
                        },
                        child: Text(
                          login,
                          style: getRegularStyle(
                              color: MyColors.appColor,
                              fontSize: MyFonts.size14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
