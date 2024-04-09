// ignore_for_file: unnecessary_import, unused_import, avoid_single_cascade_in_expression_statements

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';

import 'package:idaawee/commons/common_imports/apis_commons.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/user_main_menu/views/main_menu_screen.dart';
import 'package:idaawee/utils/utils.dart';

class UserRegisterProvider extends GetxController {
  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final dateBorthController = TextEditingController().obs;
  final phonenumberController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  ApiServices services = ApiServices();
  RxString errorString = ''.obs;
  ////   user register in Api
  userRegister(BuildContext context) async {
    errorString.value = '';
    _isLoading.value = true;
    update();
    final username = usernameController.value.text.toString();
    final email = emailController.value.text.toString();
    final password = passwordController.value.text.toString();

    await services.userRegisterApi(username, email, password).then((value) {
      if (value is String) {
        errorString.value = value;
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserMainMenuScreen()));
      }
    }).onError((error, stackTrace) {});

    _isLoading.value = false;
    update();
  }

  ////user register in GoogleSignIn

  userRegisterGoogleSignIn(BuildContext context) {
    services.googleSignIn(context)
      ..then((value) {
        Get.snackbar(
            'user register google SignIn', 'user reigster google ${value}');
      }).onError((error, stackTrace) {
        Get.snackbar(
            'User register Google error', 'User Register error $error');
      });
  }
}
