// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idaawee/features/user/user_notification/widget/u_notification_card.dart';
import 'package:idaawee/main.dart';
import 'package:idaawee/providers/user_providers/notification_provider.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/universal_models/user_models/get_user_book_appointment_model.dart';
import 'package:idaawee/utils/global.dart';

class UAppointmentNotification extends StatefulWidget {
  UAppointmentNotification({Key? key}) : super(key: key);

  @override
  State<UAppointmentNotification> createState() =>
      _UAppointmentNotificationState();
}

class _UAppointmentNotificationState extends State<UAppointmentNotification> {
  @override
  Widget build(BuildContext context) {
    return Container();
    // return StreamBuilder<List<GetUserBookAppointmentsModel>>(
    //   stream: controller.appointmentsStream,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Center(
    //         child: Text("SNAPSHORT ERROR"),
    //       );
    //     } else if (snapshot.hasData && snapshot.data!.isEmpty) {
    //       return Center(child: Text('No appointments found'));
    //     } else if (snapshot.hasData) {
    //       final appointments = snapshot.data!;
    //       return ListView.builder(
    //         shrinkWrap: true,
    //         itemCount: appointments.length,
    //         padding: EdgeInsets.only(top: 10), // Adjusted for simplicity
    //         itemBuilder: (context, index) {
    //           print(
    //               "appointments notification screen lenght====<<<<<${appointments.length}");

    //           final appointmentDetails = appointments[index].appointmentDetails;
    //           final doctorDetails = appointments[index].doctorDetails;
    //           return Padding(
    //             padding: EdgeInsets.only(bottom: 10), // Adjusted for simplicity
    //             child: UNotificationAppointmentCard(
    //               date: appointmentDetails!.bookingDate.toString() ??
    //                   'N/A', // Adjust based on your model
    //               timeago: appointmentDetails.selectedTimeSlot ??
    //                   'N/A', // Adjust based on your model
    //               title: doctorDetails!.name.toString() ??
    //                   'Unknown Doctor',
    //               slelectedDate: appointmentDetails.selectedDate ??
    //                   'N/A',
    //             ),
    //           );
    //         },
    //       );
    //     } else {
    //       // Fallback for any other unexpected scenario
    //       return Center(child: CircularProgressIndicator());
    //     }
    //   },
    // );
  }
}
