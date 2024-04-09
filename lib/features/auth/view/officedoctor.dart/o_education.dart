import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/providers/doctor_providers/doctor_office_provider/doctor_office_register_provider.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:country_list/country_list.dart';

class Office_EducationAndExeience extends StatefulWidget {
  Office_EducationAndExeience({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<Office_EducationAndExeience> createState() =>
      _Office_EducationAndExeienceState();
}

class _Office_EducationAndExeienceState
    extends State<Office_EducationAndExeience> {
  // final TextEditingController namecontroller = TextEditingController();
  final contoller = Get.put(DoctorOfficeRegisterProvider());
  List<String> countryNames =
      Countries.list.map((country) => country.name).toList();

  String officetypeValue = 'Office Type';
  // Default value for the dropdown
  List<String> officeItems = [
    'Office Type',
    'Heart Specialist',
    'Neurologist ',
    'Eye Specialist ',
    'Dentist ',
    'Gynecology',
    'Orthopedic ',
    'Urology',
    'Otrology ',
    'Pediatric ',
    ' Skin Specialist',
    'Gasstroenterology',
    'General',
  ];

  String dropdownValue = 'Specilization';
  // Default value for the dropdown
  List<String> dropdownItems = [
    'Specilization',
    'Heart Specialist',
    'Neurologist ',
    'Eye Specialist ',
    'Dentist ',
    'Gynecology',
    'Orthopedic ',
    'Urology',
    'Otrology ',
    'Pediatric ',
    ' Skin Specialist',
    'Gasstroenterology',
    'General',
  ];

  @override
  Widget build(BuildContext context) {
    String countryValue =
        countryNames.isNotEmpty ? countryNames[0] : 'Select a country';

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: 1.sw,
      decoration: const BoxDecoration(
        color: MyColors.lightBg,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              padding10,
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                ),
                width: screenWidth * 0.95,
                child: DropdownButtonFormField<String>(
                  value: officetypeValue,
                  onChanged: (value) {
                    setState(() {
                      officetypeValue = value!;
                    });
                  },
                  iconSize: 24,
                  decoration: InputDecoration(
                    hintText: 'office type',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
                    filled: true,
                    fillColor: Colors.white,
                    // Set the border side and color
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
                        color: Colors.grey.withOpacity(0.5),
                        // Set the focused border color
                        width: 1,
                      ),
                    ),
                  ),
                  items: officeItems.map((String value) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: value,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 16,
                            color: value == officetypeValue
                                ? Colors.grey
                                : Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              padding10,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                ),
                width: screenWidth * 0.95,
                child: DropdownButtonFormField<String>(
                  value: dropdownValue,
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  iconSize: 24,
                  decoration: InputDecoration(
                    hintText: 'Spacialization',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
                    filled: true,
                    fillColor: Colors.white,
                    // Set the border side and color
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
                        color: Colors.grey.withOpacity(0.5),
                        // Set the focused border color
                        width: 1,
                      ),
                    ),
                  ),
                  items: dropdownItems.map((String value) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: value,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 16,
                            color: value == dropdownValue
                                ? Colors.grey
                                : Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              padding15,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                ),
                child: DropdownButtonFormField<String>(
                  value: countryValue,
                  onChanged: (value) {
                    setState(() {
                      countryValue = value!;
                    });
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
              padding15,
              Container(
                width: screenWidth * 0.9, // Adjust the width as needed
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        borderRadius: 12,
                        validatorFn: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        texfieldHeight: 60,
                        controller: contoller.d_office_office_street.value,
                        hintText: 'Street',
                        onChanged: (value) {},
                        onFieldSubmitted: (value) {},
                        obscure: false,
                        label: '',
                        subTitle: '',
                      ),
                    ),
                    SizedBox(
                        width: 16), // Adjust the spacing between text fields
                    Expanded(
                      child: CustomTextField(
                        borderRadius: 12,
                        validatorFn: (value) {
                          // Validation for the second text field
                        },
                        texfieldHeight: 60,
                        controller: contoller.d__office_password.value,
                        hintText: 'State',
                        onChanged: (value) {},
                        onFieldSubmitted: (value) {},
                        obscure: false,
                        label: '',
                        subTitle: '',
                      ),
                    ),
                  ],
                ),
              ),
              padding15,
              padding15,
              CustomTextField(
                borderRadius: 12,
                validatorFn: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                texfieldHeight: 60.h,
                controller: contoller.d_office_office_zipCode.value,
                hintText: 'Zip/Postal Code',
                onChanged: (value) {},
                onFieldSubmitted: (value) {},
                obscure: false,
                label: '',
                subTitle: '',
              ),
              padding20,
              NextButton(
                back: () {},
                text: 'Next',
                isbackbuton: true,
                onPressed: widget.onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }
}
