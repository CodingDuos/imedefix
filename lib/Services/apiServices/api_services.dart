// ignore_for_file: body_might_complete_normally_nullable, prefer_interpolation_to_compose_strings, non_constant_identifier_names, use_build_context_synchronously, unused_import, unnecessary_import, depend_on_referenced_packages, prefer_const_constructors, avoid_print, unused_local_variable, prefer_const_declarations, unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idaawee/Services/common_api_responses/api_post.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/features/doctor/doctor_main_menu/views/doctor_menu_screen.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_SpecificDetailsModel.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/confrom_oppointment_model.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/doctor_add_report_model.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/doctor_individual_register_model.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/doctorwslots_model.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/get_confrom_appointment.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/get_doctor_book_oppointment.dart';
import 'package:idaawee/universal_models/doctor_personal_details_model.dart';
import 'package:idaawee/universal_models/user_models/get_user_book_appointment_model.dart';
import 'package:idaawee/universal_models/user_models/get_user_report_model.dart';
import 'package:idaawee/universal_models/user_models/user_book_appointment_model.dart';
import 'package:idaawee/universal_models/user_models/user_details_model.dart';
import 'package:idaawee/utils/global.dart';
import 'package:mime/mime.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http_parser/http_parser.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:idaawee/features/auth/widgets/doctor_custom_widget/doctor_office_register_tab.dart';
import 'package:idaawee/features/user/user_main_menu/views/main_menu_screen.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/doctor_ind_login_model.dart';

import 'package:idaawee/universal_models/doctor_models/doctor_office_models/doctor_office_login_model.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_office_models/doctor_office_register_model.dart';
import 'package:idaawee/universal_models/user_models/user_login_model.dart';
import 'package:idaawee/universal_models/user_models/user_register_model.dart';
import 'package:http/http.dart' as http;
import 'package:idaawee/utils/utils.dart';

/// user register api
class ApiServices {
  static List<DoctordPersonalDetailModel>? doctorDetailsList;
  static List<DoctorAvailability>? doctortimingSlotsList;
  static List<DoctorSpecificDatailsModel>? doctorSpecificDetailsList;

  final urls = 'https://imdfx-newserver-production.up.railway.app';
  // final urls = 'http://192.168.18.63:3005';

  // final ApibaseUrl = '192.168.137.1';
  //final ApibaseUrl = 'https://imdfx-newserver-production.up.railway.app';

  /// user register api
  Future userRegisterApi(username, email, password) async {
    var url = Uri.parse('$urls/api/signup');
    var data = {"username": username, "email": email, "password": password};
    String? statuscode;
    var response = await CommonApiServicePostData.postApiData(url, data, [
      ResponsesDataHandleModel(
          statuscode: 200,
          function: (ResponseBody) {
            return;
          }),
      ResponsesDataHandleModel(
          statuscode: 409,
          function: (ResponseBody) {
            statuscode = 'User already registered status code: 409';
            Get.snackbar("User already registered", "User already registered");
          }),
      ResponsesDataHandleModel(function: (ResponseBody) {
        statuscode = 'User already registered status code: unknown';

        Get.snackbar("User  already  registration",
            "User  already register try another account ");
      })
    ]);
    return statuscode;
  }

///// user login api

  Future userLoginApi(
      BuildContext context, String email, String password) async {
    var url = Uri.parse('$urls/api/login');

    // Your login data to send
    var data = {"email": email, "password": password};

    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      //   print('Status code: ${response.statusCode}');
      //  print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Global().saveUserId('');
        Global.userId = response.body;
        print('Login success: ${response.body}');
        Global().saveUserId(response.body);

        Get.snackbar("Login Successful", "You are now logged in.",
            snackPosition: SnackPosition.BOTTOM);

        Navigator.pushNamed(context, AppRoutes.userMainMenuScreen);
      } else if (response.statusCode == 401) {
        return 'Failed to login. Status code: ${response.statusCode}';
      } else {
        print('Failed to login. Status code: ${response.statusCode}');
        return 'Failed to login. Status code: ${response.statusCode}';
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar("Login Error", "An error occurred during login: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  ///    doctor individual register Api

  Future<DoctorIndRegisterModel?> doctorIndividualRegisterApi(
      DoctorIndRegisterModel data) async {
    var url = Uri.parse('$urls/api/doctorpersnoldetails');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: {},
      );

      print('Register  success: ${data.toJson()}');

      print('Register status code: ${response.statusCode}');
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar("Doctor register  Successful", "You are now logged in.",
            snackPosition: SnackPosition.BOTTOM);
      } else if (response.statusCode == 409) {
        Fluttertoast.showToast(
            msg: responseData['email'] ?? 'User already exists');
      } else {
        Fluttertoast.showToast(
            msg:
                'doctor a register: ${responseData['email'] ?? 'doctor already register '}');
      }
    } catch (e) {
      print('Error during registration: $e');
      Fluttertoast.showToast(msg: 'Failed to doctor registration  register :');
    }
  }

  // individual doctor login api

  Future<void> doctorLoginApi(
      BuildContext context, String email, String password) async {
    var url = Uri.parse('$urls/api/doctorlogin');
    var data = {"email": email, "password": password};
    try {
      print(data);
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        Global().saveUserId('');
        print('Login success: ${response.body}');
        Global().saveUserId(response.body);

        print(' doctor Login success: ${response.body}');

        Get.snackbar("Login Successful", "You are now logged in.",
            snackPosition: SnackPosition.BOTTOM);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => DoctorMainMenuScreenMain())));
      } else if (response.statusCode == 401) {
        print('Invalid credentials');
        Get.snackbar("Login Failed", "Invalid email or password.",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print('Failed to login. Status code: ${response.statusCode}');
        Get.snackbar("Login Error", "Failed to login. Please try again later.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar("Login Error", "An error occurred during login: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //// get doctor personal details in user screen
  Future<List<DoctordPersonalDetailModel>> fetchDoctorDetailsList(
      String spaciality) async {
    print('object asg');
    final response =
        await http.get(Uri.parse('$urls/api/doctors-by-specialty/$spaciality'));

    if (response.statusCode == 200) {
      print("doctor details ${response.body}");

      List<dynamic> jsonList = json.decode(response.body);

      // Map each JSON object to a DoctordPersonalDetailModel instance
      doctorDetailsList = jsonList
          .map((json) => DoctordPersonalDetailModel.fromJson(json))
          .toList();

      //  print('list data===>>> ${doctorDetailsList}');
      return doctorDetailsList!;
    } else {
      return doctorDetailsList!;
    }
  }

  Future<List<DoctorAvailability>> fetchDoctorTimingSlotsList(
      String doctorId) async {
    final response =
        await http.get(Uri.parse('$urls/api/get-doc_avaibletime/$doctorId'));

    print(
        response.statusCode.toString() + doctorId.toString() + 'hlllllllllll');

    if (response.statusCode == 200) {
      print("doctor details ${response.body}");

      Map<String, dynamic> jsonData = json.decode(response.body);

      doctortimingSlotsList = <DoctorAvailability>[];
      jsonData['doctorAvailability'].forEach((v) {
        doctortimingSlotsList!.add(new DoctorAvailability.fromJson(v));
      });

      return doctortimingSlotsList!;
    } else {
      return doctortimingSlotsList!;
    }
  }

  ////    get pecific doctor details  api
  Future<DoctorSpecificDatailsModel> fetchSpecificDoctorDetails(
      String doctorId) async {
    print('Doctor details 1');
    final response =
        await http.get(Uri.parse('$urls/api/getDoctorDetail/$doctorId'));
    print('Doctor details 2');
    print("Doctor details: ${response.body}");
    if (response.statusCode == 200) {
      print('Doctor details 3');
      print("Doctor details: ${response.body}");
      // Assuming the response body is a JSON object for a single doctor
      DoctorSpecificDatailsModel doctorDetails =
          DoctorSpecificDatailsModel.fromJson(json.decode(response.body));
      Global.userId = doctorDetails.sId.toString();
      print('Doctor id: ${doctorDetails.sId}');
      // Navigator.pushNamed(context, AppRoutes.userPlatinumProviderScreen);

      return doctorDetails;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }

  Future<List<DoctorSpecificDatailsModel>> fetchSpecificDoctor() async {
    final response =
        await http.get(Uri.parse('$urls/api/doctorpersnoldetails'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);

      List<DoctorSpecificDatailsModel> doctorDetails =
          jsonList.map((e) => DoctorSpecificDatailsModel.fromJson(e)).toList();

      return doctorDetails;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }

  Future<DoctorSpecificDatailsModel> fetchSpecificDoctorDetailsforDoctorScreen(
      String doctorId) async {
    print('get doctor spacific details for doctor screen =====<<<<');
    String? userIds = await Global().getUserId();
    String userIdsss = '65bb57ae4dda0d16011a37b5';
    print("  doctor id doctor home screen sss${userIds.toString()}");
    print(' doctor id doctor home screen Doctor details 1');
    final response =
        await http.get(Uri.parse('$urls/api/getDoctorDetail/$doctorId'));
    print(' doctor id doctor home screen Doctor details 2');
    print(" doctor id doctor home screen Doctor details: ${response.body}");
    if (response.statusCode == 200) {
      print(' doctor id doctor home screen Doctor details 3');
      print(" doctor id doctor home screen Doctor details: ${response.body}");

      DoctorSpecificDatailsModel doctorDetails =
          DoctorSpecificDatailsModel.fromJson(json.decode(response.body));

      print('Doctor name===<<<< id: ${doctorDetails.name}');

      return doctorDetails;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }
  //// getSpecific Doctor Details  for doctor screen

  // Future<DoctorSpecificDatailsModel> getSpecificDoctorDetails(
  //     String doctorId) async {
  //   String? userIds = await Global().getUserId();
  //   print("  doctor id sss${userIds}");
  //

  //   if (response.statusCode == 200) {
  //     print("Doctor homes screen details: ${response.body}");

  //     DoctorSpecificDatailsModel doctorDetails =
  //         DoctorSpecificDatailsModel.fromJson(json.decode(response.body));
  //     // Global.saveUserId(doctorDetails.sId.toString());
  //     print('Doctor id: ${userIds}');
  //     //   Navigator.pushNamed(context, AppRoutes.userPlatinumProviderScreen);

  //     return doctorDetails;
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // throw an exception.
  //     throw Exception('Failed to load data');
  //   }
  // }

  //// user google Sig in with out firebase database
  static var data;

  Future googleSignIn(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      data = await googleSignIn.signIn();
      print("User data: $data");

      if (data != null) {
        print("Google Sign-In successful.");

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserMainMenuScreen()));
      } else {
        print("Google Sign-In returned null.");
        Get.snackbar('Google Sign In Error', "User data is null.");
      }
    } catch (e) {
      print("Google Sign-In error: $e");
      Get.snackbar('Google Sign In Error', "Exception: $e");
    }
  }

  Future facebookLoginApi() async {
    try {
      print('FaceBook Login  ========= >>>>>>');

      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final UserData = await FacebookAuth.i.getUserData();
        print(UserData);

        Get.snackbar('User Facebook  ', ' SuccessFull login in facebook  ');
      } else {
        Get.snackbar('User Facebook  ', ' error   in facebook  login  ');
      }
    } catch (e) {
      Get.snackbar('User Facebook  ', '$e ');
    }
  }

  /// book user  appointment
  Future<UserBookAppointmentMode?> bookUserappointmentApi(
      UserBookAppointmentMode data) async {
    var url = Uri.parse('$urls/api/bookappointment');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data.toJson()),
      );

      final responseData = json.decode(response.body);
      // print("Appointment  book response =====>>>>>> ${responseData}");
      if (response.statusCode == 200) {
        //    print('Appointment book   success: ${response.body}');
        Get.snackbar(
            "user Appointment book   Successful", "Your Appointment book ",
            snackPosition: SnackPosition.BOTTOM);
        // Successful response, handle accordingly
        print('Appointment book   body response: ${response.body}');
      } else {}
    } catch (e) {
      print('Error during Appointment: $e');
      Fluttertoast.showToast(msg: 'Failed to user Appointment  book  :');
    }
  }

  List<GetUserBookAppointmentsModel> appointments = [];
  Stream<List<GetUserBookAppointmentsModel>> getUserBookAppointments(
      String userId) async* {
    print("  user id sss   ===>>>>${userId}");

    while (true) {
      final response =
          await http.get(Uri.parse('$urls/api/appointments/$userId'));

      if (response.statusCode == 200) {
        List<dynamic> responseBody = json.decode(response.body);

        List<GetUserBookAppointmentsModel> appointments = responseBody
            .map((appointmentJson) =>
                GetUserBookAppointmentsModel.fromJson(appointmentJson))
            .toList();
        print("Appointment details: ${response.body}");
        yield appointments;

        await Future.delayed(Duration(seconds: 10));
      } else {
        yield appointments;

        await Future.delayed(Duration(seconds: 10));

        print(response.statusCode);
        print(response.body);
      }
    }
  }

  Future<List<getDoctorBookOppointment>> getDoctorBookAppointments(
      String userId) async {
    var docId = userId.replaceAll(RegExp(r'^"|"$'), '');
    final response =
        await http.get(Uri.parse('$urls/api/doc_appointments/$docId'));

    if (response.statusCode == 200) {
      List<dynamic> responseBody = json.decode(response.body);
      return responseBody
          .map((e) => getDoctorBookOppointment.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }

//// GET S  LOGIN USER Details

  Future<UserDetailsModel> fetchLoginUserDetailsforUserScreen(
      String userId) async {
    print('user  details  =====>>>>>1');
    final response = await http.get(Uri.parse('$urls/api/getpatient/$userId'));
    print('user details  =====>>>>> 2');
    print("user  details  =====>>>>>:<<<<<<< ${response.body}");
    if (response.statusCode == 200) {
      print('user  details  =====>>>>> 3');
      print("user  details  =====>>>>>: ${response.body}");

      UserDetailsModel UserDetails =
          UserDetailsModel.fromJson(json.decode(response.body));
      print(' user  details in user   from api <<<<<<<<<<<<<++++++>>>>>  ');

      print(" ====>>>>>>>>> ${response.body} ====>>>>");
      return UserDetails;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }

  /////   doctor conform oppointment api
  Future<ConformOppointmentModel?> doctorConformAppointment(
      String docId, ConformOppointmentModel data) async {
    print('doctor id ----$docId');
    print('doctor confrom 1----$docId');

    // Adjust the endpoint URL
    var url = Uri.parse('$urls/api/conformappointment/:$docId');

    print('doctor confrom 2----$docId');
    // Ensure the field name matches the API's expectation
    print('doctor confrom 3----$docId');

    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(data.toJson()), // Convert model object to JSON string
      );
      print('doctor confrom 4----$docId');
      print('response body: ${response.body}');
      if (response.statusCode == 200) {
        print('doctor confrom 5----$docId');
        print('Conform success: ${response.body}');
        Get.snackbar("Conform Successful", "You are now confirmed",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print('doctor confrom 6----$docId');
        print('Failed to conform. Status code: ${response.statusCode}');
        Get.snackbar(
          "Conform Error",
          "Failed to conform. Please try again later.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        "Conform Error",
        "An error occurred during conform: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// get all conform oppointment ////
  Future<List<GetAppointmentDetails>> getAllConformAppointment(
      BuildContext context, String docId) async {
    print('get doctor conform appointment =====<<<< $docId');

    final response = await http.get(Uri.parse('$urls/api/mypatient/$docId'));
    print("get doctor conform appointment: ${response.body}");
    if (response.statusCode == 200) {
      // Decode the response body which is expected to be a List of JSON objects
      List<dynamic> responseBody = json.decode(response.body);
      print("get doctor conform appointment: ${response.body}");
      // Check if the response body is not empty to avoid errors
      Navigator.pushNamed(context, AppRoutes.addReportScreen);
      if (responseBody.isNotEmpty) {
        // Convert each item in the list to a GetUserBookAppointmentsModel instance
        List<GetAppointmentDetails> doctorDetailsList = responseBody
            .map<GetAppointmentDetails>(
                (item) => GetAppointmentDetails.fromJson(item))
            .toList();

        return doctorDetailsList;
      } else {
        // Handle the case where the list is empty
        throw Exception('No data found');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  ////     cancel oppointment api

  Future<void> doctorCancelAppointment(String id) async {
    print('doctor id ----$id');
    print('doctor confrom 1----$id');

    // Adjust the endpoint URL
    var url = Uri.parse('$urls/api/cancelappointment/:$id');

    print('doctor confrom 2----$id');
    // Ensure the field name matches the API's expectation
    print('doctor confrom 3----$id');

    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
      );
      print('doctor confrom 4----$id');
      print('response body: ${response.body}');
      if (response.statusCode == 200) {
        print('doctor confrom 5----$id');
        print('Conform success: ${response.body}');
        Get.snackbar("Conform Successful", "You are now confirmed",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print('doctor confrom 6----$id');
        print('Failed to conform. Status code: ${response.statusCode}');
        Get.snackbar(
          "Conform Error",
          "Failed to conform. Please try again later.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        "Conform Error",
        "An error occurred during conform: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  ///  add doctor report  api

  Future<DoctorAddReportModel?> AddDoctorReport(
      BuildContext context,
      DoctorAddReportModel data,
      String userId,
      File file,
      String reportType) async {
    var url = Uri.parse('$urls/api/medicalreport/$userId');
    try {
      var request = http.MultipartRequest('POST', url);
      var multipartFile =
          await http.MultipartFile.fromPath(reportType, file.path);
      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 201) {
        Get.snackbar("Report Successful Added", "Your reprot has been added",
            snackPosition: SnackPosition.BOTTOM);
        Navigator.pop(context);
      } else {
        print(
            'Failed to upload file. Server responded with status code: ${response.statusCode}');
      }

      // final response = await http.post(
      //   url,
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //   },
      //   body: jsonEncode(data.toJson()),
      // );

      // final responseData = json.decode(response.body);
      // print(" report   body  response =====>>>>>> ${responseData}");
      // print(" report   body  response =====>>>>>> ${response.statusCode}");
      // if (response.statusCode == 200) {
      //   print(' report  book   success: ${response.body}');

      //   // Successful response, handle accordingly
      //   print(' doctor report body response: ${response.body}');
      //   Navigator.pop(context);
      // } else {}
    } catch (e) {
      print('Error during report : $e');
      Fluttertoast.showToast(msg: 'Failed to user   report book  :');
    }
  }

  //// get doctor report  api

  Future<List<PrescriptionResponse>> getAllUserReport(String userId) async {
    print('get user id user  report    =====<<<< $userId');

    final response =
        await http.get(Uri.parse('$urls/api/get-prescriptions/$userId'));
    print("get doctor conform appointment: ${response.body}");
    if (response.statusCode == 200) {
      // Decode the response body which is expected to be a List of JSON objects
      List<dynamic> responseBody = json.decode(response.body);
      print("get doctor conform appointment: ${response.body}");
      // Check if the response body is not empty to avoid errors

      if (responseBody.isNotEmpty) {
        // Convert each item in the list to a GetUserBookAppointmentsModel instance
        List<PrescriptionResponse> doctorDetailsList = responseBody
            .map<PrescriptionResponse>(
                (item) => PrescriptionResponse.fromJson(item))
            .toList();

        return doctorDetailsList;
      } else {
        // Handle the case where the list is empty
        throw Exception('No data found');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
