import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/confrom_oppointment_model.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/get_confrom_appointment.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/get_doctor_book_oppointment.dart';
import 'package:idaawee/utils/global.dart';

import '../../../universal_models/user_models/get_user_book_appointment_model.dart';

class GetConfromAppointmentProvider extends GetxController {
  ApiServices services = ApiServices();
  GetConfromAppointmentProvider(BuildContext context) {
    inti(context);
  }

  inti(BuildContext context) async {
    String? userId = await Global().getUserId();
    String docId = userId!.replaceAll(RegExp(r'^"|"$'), '');

    print('doc id===>>>>$userId');
    print(" home provider screen user id ${docId}");
    if (docId != null) {
     await GetConformAppointment(context ,docId);
    } else {
      print('user id null  ------->>> ');
    }
  }

  final ComfromAppopintmentList = <GetAppointmentDetails>[].obs;

  GetConformAppointment( BuildContext context, docId) async {
    try {
      print('doctor specific details method calling ===>>> ');
      final List<GetAppointmentDetails> data =
          await services.getAllConformAppointment(context,docId);

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
