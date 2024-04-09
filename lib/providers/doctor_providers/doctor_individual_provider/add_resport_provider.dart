import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/doctor_add_report_model.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/get_confrom_appointment.dart';
import 'package:idaawee/utils/global.dart';

class AddReportProvider extends GetxController {
  AddReportProvider() {
    init();
  }

  final reportController = TextEditingController().obs;
  String? filePath;
  File? fileReport;

  RxString selectedReportType = ''.obs;
  setSelectedReportType(String val) {
    selectedReportType.value = val;
    update();
  }

  setreportfile(File val) {
    fileReport = val;
    update();
  }

  String dropdownValue = 'CBC';
  // Define the selectedPatient and its setter
  RxString selectedPatient = RxString('');
  var sletedUserId = ''.obs;
  void setSelectedPatient(String value) {
    selectedPatient.value = value;
  }

  void seletedPatientid(String value) {
    sletedUserId.value = value;

    print("selted patient id luqman  ===<<<${sletedUserId}");
  }

  void result() {
    print("  file path of the user ===>>>>${filePath.toString()}");
    print(
        "  reportController   of the user ===>>>>${reportController.value.text}");
    print("  dropdownValue   of the user ===>>>>${dropdownValue.toString()}");
  }

  var docId;
  init() async {
    String? doctorId = await Global().getUserId();
    docId = doctorId!.replaceAll(RegExp(r'^"|"$'), '');
    if (docId != null) {
      print('doctor id ===>>>> $docId');
      // GetConformAppointment(docId!);
    }
  }

  ApiServices services = ApiServices();

  void AddDoctorRprot(BuildContext context) async {
    Get.snackbar(
        'report add sucessfullly ', 'doctor reprot  add  sucessfullly    ',
        backgroundColor: Colors.white,
        borderColor: Colors.grey.shade200,
        snackPosition: SnackPosition.BOTTOM);
    // DoctorAddReportModel model = DoctorAddReportModel(
    //     docId: docId,
    //     userId: sletedUserId.toString(),
    //     image: filePath,
    //     reportTitle: reportController.value.text,
    //     reportCategory: dropdownValue.toString());

    // String? userId = await Global().getUserId();

    // services.AddDoctorReport(context, model, userId.toString(), fileReport!,
    //         selectedReportType.value)
    //     .then((value) {

    // }).onError((error, stackTrace) {
    //   Get.snackbar(' reprot not found ', 'doctor  reprot not found ');
    // });
  }

  ///

  final ComfromAppopintmentList = <GetAppointmentDetails>[].obs;

  void GetConformAppointment(BuildContext context, docId) async {
    try {
      print('doctor specific details method calling ===>>> ');
      final List<GetAppointmentDetails> data =
          await services.getAllConformAppointment(context, docId);

      // If ComfromAppopintmentList is a list and you want to replace its contents
      ComfromAppopintmentList.assignAll(data); // Directly assign the new list

      print(
          ' user cxomfrom appointment list length of patient: ${ComfromAppopintmentList.length}');
      if (ComfromAppopintmentList.isNotEmpty) {
        print(
            'Username of the doctor: ${ComfromAppopintmentList[0].appointmentDetails?.docId ?? "No booking date"}');
      }
    } catch (e) {
      print("Error fetching doctor details: $e");
      // Handle any errors here, maybe show a message to the user
    }
  }
}
