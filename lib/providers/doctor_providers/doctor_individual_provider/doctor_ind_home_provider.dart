// ignore_for_file: avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_SpecificDetailsModel.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/get_doctor_book_oppointment.dart';
import 'package:idaawee/utils/global.dart';

class DoctorIndHomeProvider extends GetxController {
  var SpecificDoctorDetailsList = <DoctorSpecificDatailsModel>[].obs;

  ApiServices services = ApiServices();
  DoctorIndHomeProvider() {
    init();
  }
  String doctorName = '';
  String? userId;
  init() async {
    userId = await Global().getUserId();
    if (userId != null) {
      print("Doctor ID doctor home screen provider  sss  /////  $userId");
      await DoctorSpecificDoctorDetails(userId!);
      if (Doctorbookappointmentlist.isEmpty) {
        getDoctorappointment(userId!);
        print(' list is empty  =======>>>>');
      } else {
        print(' list is not  null=======');
      }
    } else {
      print("doctor id ID is null");
    }
  }

//// get spacific doctor details / ////////

  // Fetch specific doctor details
  Future<void> DoctorSpecificDoctorDetails(String dId) async {
    try {
      dId = dId.replaceAll('"', '');

      final data =
          await services.fetchSpecificDoctorDetailsforDoctorScreen(dId);
      SpecificDoctorDetailsList.assignAll([data]);
    } catch (e) {
      print("Error fetching doctor details: $e");
    }
  }

  // void clearDoctorDetails() {
  //   SpecificDoctorDetailsList.clear();
  //   Doctorbookappointmentlist.clear();
  // }

  // get doctor book oppointment

  RxList<getDoctorBookOppointment> Doctorbookappointmentlist =
      <getDoctorBookOppointment>[].obs;

  Future<void> getDoctorappointment(String UserId) async {
    print('===>>>>> 1');
    try {
      List<getDoctorBookOppointment> fetchedAppointments =
          await services.getDoctorBookAppointments(UserId);
      print('===>>>>> 2');
      Doctorbookappointmentlist.clear();
      print('===>>>>> 4');
      print(
          " is empty lenght      ====<<<<<<<${Doctorbookappointmentlist.length}");
      print('===>>>>> 5');
      Doctorbookappointmentlist.assignAll(fetchedAppointments);
      print('===>>>>> 6');

      // Print total appointments fetched
      print(
          "Total appointments in the list doctor home screen ----: ${Doctorbookappointmentlist.length}");

      // Print details of the first appointment if any
      if (Doctorbookappointmentlist.isNotEmpty) {
        print(
            "Patient name appointments in the list of doctor api ----: ${Doctorbookappointmentlist[0].patietnDetails!.username!}");
        print(
            "Patient ID appointments in the list of doctor api ----: ${Doctorbookappointmentlist[0].patietnDetails!.sId!}");
      }
    } catch (error) {
      print("Error fetching appointments: $error");
    }
  }
}
