// ignore_for_file: unused_field, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/doctor_individual_register_model.dart';

class DoctorIndRegisterProvider extends GetxController {
  File? imagePath;

  final d_ind_email = TextEditingController().obs;
  final d_ind_password = TextEditingController().obs;
  final d_ind_title = TextEditingController().obs;
  final d_ind_full_name = TextEditingController().obs;
  final d_ind_date_of_birth = TextEditingController().obs;
  final d_ind_phone_number = TextEditingController().obs;
  final d_ind_specialization = TextEditingController().obs;
  final d_ind_condion_tretment = TextEditingController().obs;
  final d_ind_about_yourself = TextEditingController().obs;
  final d_ind_education = TextEditingController().obs;
  final d_ind_collage = TextEditingController().obs;
  final d_ind_licene_number = TextEditingController().obs;
  final d_ind_years_of_experiance = TextEditingController().obs;
  final d_ind_once_date = TextEditingController().obs;
  final d_ind_once_time_form = TextEditingController().obs;
  final d_ind_once_time_till = TextEditingController().obs;
  final d_ind_once_consultation_free = TextEditingController().obs;
  final d_ind_daily_dateTile = TextEditingController().obs;
  final d_ind_daily_dateFrom = TextEditingController().obs;
  final d_ind_daily_time_form = TextEditingController().obs;
  final d_ind_daily_time_till = TextEditingController().obs;
  final d_ind_daily_consultation_free = TextEditingController().obs;
  final d_ind_weekly_date = TextEditingController().obs;
  final d_ind_weekly_time_form = TextEditingController().obs;
  final d_ind_weekly_time_till = TextEditingController().obs;
  final d_ind_weeekly_consultation_free = TextEditingController().obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ApiServices services = ApiServices();

  void doctorIndRegister() {
    print('object');
    Once once = Once(
        oncedate: d_ind_once_date.value.text.toString(),
        oncetimefrom: d_ind_once_time_form.value.text.toString(),
        oncetimetill: d_ind_once_time_till.value.text.toString(),
        consultationfees: d_ind_once_consultation_free.value.text.toString());
    Daily daily = Daily(
      dailydatefrom: d_ind_daily_dateTile.value.text.toString(),
      dailytimefrom: d_ind_daily_time_form.value.text.toString(),
      dailydatetill: d_ind_daily_time_till.value.text.toString(),
      dailyconsultationfree:
          d_ind_daily_consultation_free.value.text.toString(),
      dailytimetill: d_ind_daily_time_till.value.text.toString(),
    );
    Weekly weekly = Weekly(
      weekconsultationfree:
          d_ind_weeekly_consultation_free.value.text.toString(),
      weeklyday: d_ind_weekly_date.value.text.toString(),
      weektimefrom: d_ind_weekly_time_form.value.text.toString(),
      weektimetill: d_ind_weekly_time_till.value.text.toString(),
    );
    DoctorIndRegisterModel doctorIndModel = DoctorIndRegisterModel(
        imageBase64: imagePath.toString(),
        name: d_ind_full_name.value.text.toString(),
        email: d_ind_email.value.text.toString(),
        password: d_ind_password.value.text.toString(),
        specialization: d_ind_specialization.value.text.toString(),
        conditionstreatment: d_ind_condion_tretment.value.text.toString(),
        aboutself: d_ind_about_yourself.value.text.toString(),
        education: d_ind_education.value.text.toString(),
        colloge: d_ind_collage.value.text.toString(),
        license: d_ind_licene_number.value.text.toString(),
        yearofexperience: d_ind_years_of_experiance.value.text.toString(),
        once: once,
        daily: daily,
        weekly: weekly);

    try {
      services.doctorIndividualRegisterApi(doctorIndModel).then((value) {
        if (value != null) {
          print(value);
          print('object khan mashwani ');
          Get.snackbar('doctor register', 'doctor already register ');
        }
      }).onError((error, stackTrace) {
        Get.snackbar(
            'doctor register', 'doctor registration ${error!.toString()}');
      });
    } catch (e) {
      Get.snackbar('doctor register failed', e.toString());
    }
  }
}
