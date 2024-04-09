// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';

class DoctorOfficeLoginProvider extends GetxController {
  final d_email = TextEditingController().obs;
  final d_password = TextEditingController().obs;

  ApiServices services = ApiServices();
  final formKey = GlobalKey<FormState>();
  void rgister() {
    print('doctor office login email $d_email');
    print('doctor office login password $d_password');
  }

  // void DoctorOfficeLogin() {
  //   services
  //       .doctorOfficeLoginApi(
  //           d_email.value.text.toString(), d_password.value.text.toString())
  //       .then((value) {
  //     Get.snackbar('Doctor office login',
  //         'Doctor office login ${value!.token.toString()}');
  //   }).onError((error, stackTrace) {
  //     Get.snackbar(
  //         'Doctor office loogin   error', ' Doctor office  login $error');
  //   });
  // }
}
