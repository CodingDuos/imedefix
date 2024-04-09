import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';

import 'package:idaawee/commons/common_imports/common_libs.dart';

class UserSignProvider extends GetxController {
  // LoginRepositery service = LoginRepositery();

  final formKey = GlobalKey<FormState>();
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  RxString errorString = ''.obs;

  ApiServices services = ApiServices();

  ///   User login with email  and password
  void userLogin(BuildContext context) async {
    _isLoading.value = true;
    errorString.value = '';
    update();
    final email = emailController.value.text.toString();
    final password = passwordController.value.text.toString();

    await services.userLoginApi(context, email, password).then((value) {
      if (value is String) {
        errorString.value = value;
      }
    }).onError((error, stackTrace) {
      Get.snackbar('login provider ', 'login error');
    });
    _isLoading.value = false;
    update();
  }

  //// user login with googleSigIn account
  userGoogleSigIn(BuildContext context) {
    services.googleSignIn(context).then((value) {
      Get.snackbar('google SigIn provider', '${value!.token.toString()}');
    }).onError((error, stackTrace) {
      Get.snackbar('google SigIn provider ', 'GoogleSigIn $error');
    });

    //print(ApiServices.data);
  }

  faceBookLogin() {
    services.facebookLoginApi().then((value) {
      Get.snackbar('facebook  SigIn provider', '${value!.token.toString()}');
    }).onError((error, stackTrace) {
      Get.snackbar(' facebook  SigIn provider', '${error.toString()}');
    });
  }
}
