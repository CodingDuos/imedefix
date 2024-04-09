import 'dart:async';
import 'package:get/get.dart';
import 'package:idaawee/universal_models/user_models/get_user_book_appointment_model.dart';
import 'package:idaawee/utils/global.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';

class NotificationProvider extends GetxController {
  final _appointmentsStreamController =
      StreamController<List<GetUserBookAppointmentsModel>>.broadcast();

  Stream<List<GetUserBookAppointmentsModel>> get appointmentsStream =>
      _appointmentsStreamController.stream;

  ApiServices services = ApiServices();

  var userbookappointmentlist = <GetUserBookAppointmentsModel>[].obs;

  NotificationProvider() {
    init();
  }

  init() async {
    String? userId = await Global().getUserId();
    print(" home provider screen user id ${userId}");
    if (userId != null) {
      //  await getuserappointment(userId.toString());
    } else {
      print('user id null  ------->>> ');
    }
  }

  // Future<void> getuserappointment(String UserId) async {
  //   try {
  //     services.getUserBookAppointments(UserId).listen((fetchedAppointments) {
  //       userbookappointmentlist.clear();
  //       userbookappointmentlist.addAll(fetchedAppointments);

  //       // Emit the updated list through the stream
  //       _appointmentsStreamController.add(userbookappointmentlist.toList());

  //       print(
  //           "Total appointments in the list: ${userbookappointmentlist.length}");
  //     }).onError((error) {
  //       print("Error fetching appointments: $error");
  //       // Handle any errors here, maybe show a message to the user
  //     });
  //   } catch (e) {
  //     print("Error setting up appointment stream: $e");
  //   }
  // }
}
