// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:get/get.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';

import 'package:idaawee/universal_models/doctor_models/doctor_SpecificDetailsModel.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/doctorwslots_model.dart';
import 'package:idaawee/universal_models/doctor_personal_details_model.dart';
import 'package:idaawee/universal_models/user_models/get_user_book_appointment_model.dart';
import 'package:idaawee/universal_models/user_models/user_book_appointment_model.dart';
import 'package:idaawee/universal_models/user_models/user_details_model.dart';
import 'package:idaawee/utils/global.dart';

import '../../Services/apiServices/api_services.dart';
// Import your ApiServices class

class UserHomeScreenProvider extends GetxController {
  var userDetailsList =
      <DoctordPersonalDetailModel>[].obs; // Making it observable
  var doctortimingslots = <DoctorAvailability>[].obs;
  var userSpecificDoctorDetailsList = <DoctorSpecificDatailsModel>[].obs;
  ApiServices services = ApiServices();

  String slectedDays = '';
  String weekTime = '';

  setselectedday(String val) {
    slectedDays = val;
    update();
  }

  String availableTimingSlot = '';
  setweektimeSlot(String val) {
    availableTimingSlot = val;
    update();
  }

  final cardName = TextEditingController().obs;
  final cardType = TextEditingController().obs;
  final accountNumber = TextEditingController().obs;
  final expiryYear = TextEditingController().obs;
  final expiryMonth = TextEditingController().obs;
  final cvvCode = TextEditingController().obs;
  final details = TextEditingController().obs;
  final accountTitle = TextEditingController().obs;
  var SpecificDoctorDetailsList = <DoctorSpecificDatailsModel>[].obs;
  String sletedDate = '';

  String bookingFor = '';
  String gender = '';
  String patientAge = '';

  backDetails() {
    print(' bank ====>>>>> ${cardName.value.text}');
    print(' acountTitle ====>>>>> ${cardType.value.text}');
    print(' account number ====>>>>> ${accountNumber.value.text}');
    print(' branchCode ====>>>>> ${cvvCode.value.text}');
    print(' booking for ====>>>>> ${bookingFor}');
    print(' gender ====>>>>> ${gender}');
    print(' patient age ====>>>>> ${patientAge}');
    print(' details ====>>>>> ${details.value.text.toString()}');
  }

  UserHomeScreenProvider() {
    init();
  }

  init() async {
    String? userId = await Global().getUserId();
    print(" home provider screen user id ${userId}");
    if (userId != null) {
      await getuserappointment(userId.toString());
      await SpecificUserDetails(userId);
    } else {
      print('user id null  ------->>> ');
    }
  }

  Future<List<DoctorSpecificDatailsModel>> DoctorSpecificDoctorDetails() async {
    try {
      List<DoctorSpecificDatailsModel> data =
          await services.fetchSpecificDoctor();
      return data;
    } catch (e) {
      print("Error fetching doctor details: $e");
    }
    return [];
  }

  /// get all doctor in user and showing  screen

  userSecializationDoctor(String spacilization) async {
    try {
      print('objectkhan');
      final data = await services.fetchDoctorDetailsList(spacilization);
      userDetailsList.value = data;
      update();
    } catch (e) {
      print("Error fetching doctor details: $e");
    }
  }

  fetchdoctortimingSlots(String docid) async {
    try {
      print('object slots');
      List<DoctorAvailability> data =
          await services.fetchDoctorTimingSlotsList(docid);
      doctortimingslots.value = data;
      return data;
    } catch (e) {
      print("Error fetching doctor timing slots details: $e");
    }
  }

  //// specific  doctor details

  userSpecificDoctorDetails(
    BuildContext context,
    String D_Id,
  ) async {
    try {
      print('doctor specific details method calling ===>>> ');
      final data = await services.fetchSpecificDoctorDetails(D_Id);

      userSpecificDoctorDetailsList
          .assignAll([data]); // Assign a list with a single item

      print('Username of the doctor: ${userSpecificDoctorDetailsList[0].name}');
    } catch (e) {
      print("Error fetching doctor details: $e");
      // Handle any errors here, maybe show a message to the user
    }
  }

  void BookAppointmentMethod() async {
    String? useriD = await Global().getUserId();
    DateTime now = DateTime.now();

// If you only want the date part (with the time set to 00:00:00)
    DateTime currentDate = DateTime(now.year, now.month, now.day);

// Storing the date in a variable (as a String for display purposes, for example)
    String formattedDate =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";

    final doctorId = userSpecificDoctorDetailsList[0].sId.toString();
    UserBookAppointmentMode bookAppointmentMode = UserBookAppointmentMode(
        bookingType: bookingFor.toString(),
        gender: gender.toString(),
        patientAge: patientAge.toString(),
        expiryYear: expiryYear.value.text.toString(),
        expiryMonth: expiryMonth.value.text.toString(),
        Details: details.value.text,
        cvv: cvvCode.value.text.toString(),
        cardNumber: accountNumber.value.text.toString(),
        cardName: cardName.value.text.toString(),
        cardType: cardType.value.text.toString(),
        selectedDate: slectedDays,
        selectedTimeSlot: availableTimingSlot,
        docId: doctorId,
        bookingDate: formattedDate,
        userId: useriD.toString());

    services.bookUserappointmentApi(bookAppointmentMode).then((value) {
      Get.snackbar('doctor register', 'doctor already register ');
    }).onError((error, stackTrace) {
      Get.snackbar(
          'doctor register', 'doctor registration ${error!.toString()}');
    });
  }

  //// get user BOOK APPOINTMENTS

  final _appointmentsStreamController =
      StreamController<List<GetUserBookAppointmentsModel>>.broadcast();

  Stream<List<GetUserBookAppointmentsModel>> get appointmentsStream =>
      _appointmentsStreamController.stream;

  var userbookappointmentlist = <GetUserBookAppointmentsModel>[].obs;

  Future<void> getuserappointment(String UserId) async {
    _appointmentsStreamController.add([]);
    userbookappointmentlist.clear();
    _appointmentsStreamController.addError("NoData");
    try {
      services.getUserBookAppointments(UserId).listen((fetchedAppointments) {
        userbookappointmentlist.clear();
        userbookappointmentlist.addAll(fetchedAppointments);

        // Emit the updated list through the stream
        _appointmentsStreamController.add(userbookappointmentlist.toList());

        print(
            "Total appointments in the list ----:>>>>> ${userbookappointmentlist.length}");
      }).onError((error) {
        print("Error fetching appointments: $error");
        // Handle any errors here, maybe show a message to the user
      });
    } catch (e) {
      print("Error setting up appointment stream: $e");
    }
  }

  var SpeciicUserDetailsList = <UserDetailsModel>[].obs;

  Future<void> SpecificUserDetails(String dId) async {
    print(' user details calling ====>>>>');
    try {
      dId = dId.replaceAll('"', ''); // Ensure dId is formatted correctly

      final data = await services
          .fetchLoginUserDetailsforUserScreen(dId); // Simulate fetching data
      SpeciicUserDetailsList.assignAll([data]);
    } catch (e) {
      print("Error fetching user >>>>> details: $e");
    }
  }

  Future<void> doctorpersonal(String dId) async {
    try {
      final data = await services
          .fetchLoginUserDetailsforUserScreen(dId); // Simulate fetching data
      SpeciicUserDetailsList.assignAll([data]);
    } catch (e) {
      print("Error fetching user >>>>> details: $e");
    }
  }

  void clearUserDetails() {
    SpeciicUserDetailsList.clear();
    _appointmentsStreamController.add([]);
    userbookappointmentlist.clear();
    _appointmentsStreamController.addError("NoData");
  }
}
