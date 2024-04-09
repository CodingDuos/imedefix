import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_SpecificDetailsModel.dart';
import 'package:idaawee/utils/global.dart';

class DoctorIndLoginProivder extends GetxController {
  final d_ind_email = TextEditingController().obs;

  final d_ind_password = TextEditingController().obs;
 
  ApiServices services = ApiServices();

  // void doctorIndLogin() {
  //   services
  //       .doctorIndividualLoginApi(d_ind_email.value.text.toString(),
  //           d_ind_password.value.text.toString())
  //       .then((value) {
  //     Get.snackbar('doctor Ind Login provider', '${value!.token.toString()}');
  //   }).onError((error, stackTrace) {
  //     Get.snackbar('doctor Ind Login provider ', 'doctor In dLogin error');
  //   });
  //   ;
  // }

  DoctorIndLoginProivder() {
  
  }

  void doctorIndLogin( BuildContext context){
    print(' doctor ind username ${d_ind_email.value.toString()} ');
    print(' doctor ind password ${d_ind_password.value.toString()} ');
    services
        .doctorLoginApi(context,d_ind_email.value.text.toString(),
            d_ind_password.value.text.toString())
        .then((value) {
      //   Get.snackbar("Doctor login ", "doctor   ");
    }).onError((error, stackTrace) {
      Get.snackbar("doctor", 'doctor login error');
    });
  }

 
}
