import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';

class UserSignController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  List<Map<String, TextEditingController>> ControllerList = [
    {
      'email': TextEditingController(),
      'password': TextEditingController(),
      'phone': TextEditingController()
    }
  ];
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  ApiServices services = ApiServices();
  void setLoading(bool loading) {
    _isLoading.value = loading;
    update();
  }
}
