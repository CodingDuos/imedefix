// ignore_for_file: must_be_immutable

import 'package:country_list/country_list.dart';
import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/features/auth/view/doctor_registration.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_register_provider.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class EducationAndExeience extends StatelessWidget {
  EducationAndExeience(
      {super.key, required this.onPressed, required this.onPressedback});
  final VoidCallback onPressed;
  final VoidCallback onPressedback;

  // final TextEditingController namecontroller = TextEditingController();
  DoctorRegistration doctorRegistration =
      DoctorRegistration(isofficedoctor: true);

  final contoller = Get.put(DoctorIndRegisterProvider());
  List<String> countryNames =
      Countries.list.map((country) => country.name).toList();

  @override
  Widget build(BuildContext context) {
    String countryValue =
        countryNames.isNotEmpty ? countryNames[0] : 'Select a country';
    return Container(
      width: 1.sw,
      decoration: const BoxDecoration(
        color: MyColors.lightBg,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: ListView(
          children: [
            SizedBox(
              height: 15.h,
            ),
            padding10,
            CustomTextField(
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please eduction';
                }
                return null;
              },
              texfieldHeight: 60.h,
              controller: contoller.d_ind_education.value,
              hintText: 'Education',
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: '',
              subTitle: '',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              texfieldHeight: 60.h,
              controller: contoller.d_ind_collage.value,
              hintText: 'College/ University',
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: '',
              subTitle: '',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              borderRadius: 12,
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              texfieldHeight: 60.h,
              controller: contoller.d_ind_licene_number.value,
              hintText: 'license & Number',
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: '',
              subTitle: '',
            ),
            padding10,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
              ),
              child: DropdownButtonFormField<String>(
                value: countryValue,
                onChanged: (value) {
                  countryValue = value!;
                },
                iconSize: 25,
                decoration: InputDecoration(
                  hintText: 'Select a country',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                      color: MyColors.loginScreenTextColor.withOpacity(0.16),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                      color: MyColors.loginScreenTextColor.withOpacity(0.16),
                      width: 1,
                    ),
                  ),
                ),
                items: countryNames.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 16,
                                color: value == countryValue
                                    ? Colors.grey
                                    : Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Secure & Confidential',
                    style: getSemiBoldStyle(
                        color: MyColors.grey, fontSize: MyFonts.size18),
                  ),
                ],
              ),
            ),
            CustomTextField(
              borderRadius: 12,
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              texfieldHeight: 60.h,
              controller: contoller.d_ind_years_of_experiance.value,
              hintText: 'Years Of Experiences',
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: '',
              subTitle: '',
            ),
            padding20,
            NextButton(
              text: 'Next',
              back: onPressedback,
              isbackbuton: true,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
