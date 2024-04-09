import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/confrom_oppointment_model.dart';
import 'package:idaawee/utils/global.dart';

class DocotrIndConfromOppointmentProvider extends GetxController {
  ApiServices services = ApiServices();

  DocotrIndConfromOppointmentProvider() {
    init();
  }
  String? userId;
  init() async {
    userId = await Global().getUserId();
    if (userId != null) {
      print(
          "Doctor ID  conform oppointment  home screen provider  sss  /////  $userId");
      // doctorConformOppointmentprovider(userId!);
    } else {
      print("doctor id ID is null");
    }
  }

  doctorConformOppointmentprovider(ConformOppointmentModel model) async {
    String? useriD = await Global().getUserId();

    print(" doctor confor,m oppointment data ===>>> ${model.bookingDate}");
    print(" doctor confor,m oppointment data ===>>> ${model.docId}");
    print(" doctor confor,m oppointment data ===>>> ${model.fees}");
    String docId = '';

    if (useriD != null && useriD!.isNotEmpty) {
      docId = useriD.replaceAll(RegExp(r'^"|"$'), '');
      print("doctor conform id <<<<<<===>>>>>$docId");
    }

    services
        .doctorConformAppointment(docId, model)
        .then((value) {})
        .onError((error, stackTrace) {
      Get.snackbar('login provider ', 'login error');
    });
  }

  /// cancel oppointment

  doctorCancelprovider(String id) async {
    //   print(" doctor confor,m oppointment data ===>>> ${model.bookingDate}");
    // print(" doctor confor,m oppointment data ===>>> ${model.docId}");
    //   print(" doctor confor,m oppointment data ===>>> ${model.fees}");
    String _id = '';

    if (id != null && id!.isNotEmpty) {
      _id = id.replaceAll(RegExp(r'^"|"$'), '');
      print("doctor conform id <<<<<<===>>>>>$_id");
    }

    services
        .doctorCancelAppointment(_id)
        .then((value) {})
        .onError((error, stackTrace) {
      Get.snackbar('login provider ', 'login error');
    });
  }
}
