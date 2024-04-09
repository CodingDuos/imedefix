import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';
import 'package:idaawee/utils/global.dart';

class getDoctorReportProvider extends GetxController {
  ApiServices apiServices = ApiServices();

  getDoctorReportProvider() {
  //  init();
  }

  var docId;
  // init() async {
  //   String? doctorId = await Global().getUserId();
  //   docId = doctorId!.replaceAll(RegExp(r'^"|"$'), '');
  //   if (docId != null) {
  //     print('doctor id ===>>>> $docId');
  //     getDoctorReport(docId!);
  //   }
  // }

 
}
