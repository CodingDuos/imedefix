// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';

class DoctorOfficeRegisterProvider extends GetxController {
  final d__offoce_email = TextEditingController().obs;
  final d__office_password = TextEditingController().obs;

  final d_office_title = TextEditingController().obs;
  final d_office_fullName = TextEditingController().obs;
  final d_office_date_of_birth = TextEditingController().obs;
  final d_office_phoneNumber = TextEditingController().obs;
  final d_office_officeName = TextEditingController().obs;
  final d_office_officeEmail = TextEditingController().obs;
  final d_office_officeNumber = TextEditingController().obs;
  final d_office_about_office = TextEditingController().obs;
  final d_office_officeType = TextEditingController().obs;
  final d_office_office_Spaciality = TextEditingController().obs;
  final d_office_officeLocation = TextEditingController().obs;
  final d_office_office_street = TextEditingController().obs;
  final d_office_office_city = TextEditingController().obs;
  final d_office_office_zipCode = TextEditingController().obs;

  printAllData() {
    print('Office Email: ${d__offoce_email.value.text}');
    print('Office Password: ${d__office_password.value.text}');
    print('Title: ${d_office_title.value.text}');
    print('Full Name: ${d_office_fullName.value.text}');
    print('Date of Birth: ${d_office_date_of_birth.value.text}');
    print('Phone Number: ${d_office_phoneNumber.value.text}');
    print('Office Name: ${d_office_officeName.value.text}');
    print('Office Email: ${d_office_officeEmail.value.text}');
    print('Office Number: ${d_office_officeNumber.value.text}');
    print('About Office: ${d_office_about_office.value.text}');
    print('Office Type: ${d_office_officeType.value.text}');
    print('Office Specialty: ${d_office_office_Spaciality.value.text}');
    print('Office Location: ${d_office_officeLocation.value.text}');
    print('Office Street: ${d_office_office_street.value.text}');
    print('Office City: ${d_office_office_city.value.text}');
    print('Office Zip Code: ${d_office_office_zipCode.value.text}');
  }

  ApiServices services = ApiServices();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // void doctorOfficeRegister() {
  //   services.doctorOfficeRegesterApi(
  //       d__offoce_email.value.text, d__office_password.value.text);
  // }
}
