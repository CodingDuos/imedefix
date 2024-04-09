import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/features/auth/widgets/doctor_table.dart';
import 'package:idaawee/features/auth/widgets/u_login_welcome_section.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_register_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DoctorOfficeLoginTavView extends StatefulWidget {
  DoctorOfficeLoginTavView({super.key, required this.isofficedocor});
  bool isofficedocor;

  @override
  State<DoctorOfficeLoginTavView> createState() => _DoctorTabSignInState();
}

class _DoctorTabSignInState extends State<DoctorOfficeLoginTavView> {
  final emailController = TextEditingController();
  final titlecontroller = TextEditingController();
  final forgotPassCtr = TextEditingController();
  final passwordController = TextEditingController();
  final dateBorthController = TextEditingController();
  final controller = Get.put(DoctorIndRegisterProvider());
  bool passObscure = true;
  // final _formKey = GlobalKey<FormState>();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CustomTextField(
            validatorFn: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            leadingIconPath: AppAssets.doctortitle,
            texfieldHeight: 60.h,
            controller: titlecontroller,
            hintText: 'Title',
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
            leadingIconPath: AppAssets.user,
            texfieldHeight: 60.h,
            controller: emailController,
            hintText: 'Full Name ',
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
            controller: controller.d_ind_email.value,
            hintText: 'Email',
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
          padding10,
          CustomTextField(
            validatorFn: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            leadingIconPath: AppAssets.key,
            texfieldHeight: 60.h,
            controller: controller.d_ind_password.value,
            hintText: 'Password',
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
          padding10,
          DoctorCalenderTextField(
            validatorFn: (value) {
              if (value!.isEmpty) {
                return 'Please enter your date of birth';
              }
              return null;
            },
            leadingIconPath: '',
            texfieldHeight: 60.h,
            controller: dateBorthController,
            hintText: 'Date of Birth',
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            label: '',
            subTitle: '',
          ),
          padding10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: CustomTextField(
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
                  controller: passwordController,
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
              ),
            ],
          ),
          Row(
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
                  Text('Agree with ',
                      style: getMediumStyle(
                          color: MyColors.grey, fontSize: MyFonts.size16)),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Text(termsandConditions,
                    style: getMediumStyle(
                        color: MyColors.appColor, fontSize: MyFonts.size16)),
              ),
            ],
          ),
          padding10,
          CustomButton(
            onPressed: () {
              // if (_formKey.currentState!.validate()) {
              // if (widget.isofficedocor == true) {
              //   Navigator.pushNamed(
              //       context, AppRoutes.officedoctorRegistration);
              // } else {
              //   Navigator.pushNamed(context, AppRoutes.doctorRegistration);
              // }

              // }
            },
            buttonText: signup,
            fontSize: 18,
            borderRadius: 100.r,
            backColor: MyColors.appColor,
          ),
          const ULoginBottomSection(),
        ],
      ),
    );
  }
}
