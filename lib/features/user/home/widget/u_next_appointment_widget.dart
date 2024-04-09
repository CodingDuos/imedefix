// // ignore_for_file: prefer_const_constructors

// import 'package:get/get.dart';
// import 'package:idaawee/commons/common_imports/common_libs.dart';
// import 'package:idaawee/features/doctor/home/widgets/d_next_appointment_card.dart';
// import 'package:idaawee/features/user/home/widget/u_doctor_consulation_card.dart';
// import 'package:idaawee/features/user/user_main_menu/controller/main_menu_controller.dart';
// import 'package:idaawee/features/user/user_notification/widget/u_notification_card.dart';
// import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_home_provider.dart';
// import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_login_provider.dart';
// import 'package:idaawee/providers/user_providers/notification_provider.dart';
// import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
// import 'package:idaawee/routes/route_manager.dart';
// import 'package:idaawee/universal_models/user_models/get_user_book_appointment_model.dart';
// import 'package:idaawee/utils/constants/font_manager.dart';
// import '../../../../utils/constants/app_constants.dart';

// class UNextAppointmentWidget extends StatefulWidget {
//   const UNextAppointmentWidget({super.key, this.isdoctor = false});
//   final bool isdoctor;

//   @override
//   State<UNextAppointmentWidget> createState() => _UNextAppointmentWidgetState();
// }

// class _UNextAppointmentWidgetState extends State<UNextAppointmentWidget> {
//   bool isFavorite = false;
//   PageController pageControlleruser = PageController(viewportFraction: 1);

//   PageController pageControllerdoctor = PageController(viewportFraction: 1);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(DoctorIndHomeProvider());

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 18),
//       child: widget.isdoctor == false
//           ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Next Appointments',
//                   style: getBoldStyle(
//                       color: MyColors.textColor, fontSize: MyFonts.size16),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: 240.h,
//                   child: Stack(
//                     children: [
//                       StreamBuilder<List<GetUserBookAppointmentsModel>>(
//                         stream: controller.appointmentsStream,
//                         builder: (context, snapshot) {
//                           if (snapshot.hasError) {
//                             return Center(
//                               child: Text("SNAPSHORT ERROR"),
//                             );
//                           } else if (snapshot.hasData &&
//                               snapshot.data!.isEmpty) {
//                             return Center(child: Text('No appointments found'));
//                           } else if (snapshot.hasData) {
//                             final appointments = snapshot.data!;
//                             return ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               shrinkWrap: true,
//                               itemCount: appointments.length,
//                               padding: EdgeInsets.only(top: 10),
//                               itemBuilder: (context, index) {
//                                 final appointmentDetails =
//                                     appointments[index].appointmentDetails;
//                                 final doctorDetails =
//                                     appointments[index].doctorDetails;
//                                 return Padding(
//                                   padding: EdgeInsets.only(bottom: 10),
//                                   child: Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     child: UDoctorNextAppointmentCard(
//                                       date: appointmentDetails!.bookingDate
//                                               .toString() ??
//                                           'N/A',
//                                       time:
//                                           appointmentDetails.selectedTimeSlot ??
//                                               'N/A',
//                                       name: doctorDetails!.name.toString() ??
//                                           'Unknown Doctor',
//                                       specialist: doctorDetails!.specialization
//                                               .toString() ??
//                                           "",
//                                       image: 'assets/images/im1.png',
//                                       onTap: () {},
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           } else {
//                             return Center(child: CircularProgressIndicator());
//                           }
//                         },
//                       ),
//                       Positioned(
//                         left: 10,
//                         top: 0,
//                         bottom: 0,
//                         child: GestureDetector(
//                           onTap: () {
//                             if (pageControlleruser.hasClients) {
//                               pageControlleruser.previousPage(
//                                 duration: Duration(milliseconds: 300),
//                                 curve: Curves.easeInOut,
//                               );
//                             }
//                           },
//                           child: Icon(
//                             Icons.arrow_back_ios,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         right: -5,
//                         top: 0,
//                         bottom: 0,
//                         child: GestureDetector(
//                           onTap: () {
//                             print('ssssssss');
//                             if (pageControlleruser.hasClients) {
//                               pageControlleruser.nextPage(
//                                 duration: Duration(milliseconds: 300),
//                                 curve: Curves.easeInOut,
//                               );
//                             }
//                           },
//                           child: Icon(
//                             Icons.arrow_forward_ios,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           : Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Next Appointments',
//                     style: getBoldStyle(
//                         color: MyColors.textColor, fontSize: MyFonts.size16)),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 UDoctorNextAppointmentCard(
//                   onTap: () {
//                     Navigator.pushNamed(
//                         context, AppRoutes.userNextAppintmentScreen);
//                   },
//                   name: "Alex Anderson",
//                   specialist: "28 Years old",
//                   image: 'assets/images/whiteman.png',
//                   // rating: 5,
//                   date: 'Monday, May 12',
//                   time: '11:00 - 12:00 AM',
//                 ),
//                 SizedBox(
//                     height: 220.h,
//                     child: Stack(
//                       children: [
//                         SizedBox(
//                           height: 222.h,
//                           child: ListView.builder(
//                             controller: pageControllerdoctor,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 4, // Assuming 10 items for demonstration
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 5),
//                                 child: UDoctorNextAppointmentCard(
//                                     onTap: () {
//                                       Navigator.pushNamed(context,
//                                           AppRoutes.userNextAppintmentScreen);
//                                     },
//                                     name: "Alex Anderson",
//                                     specialist: "Dentist Specialist",
//                                     image: 'assets/images/whiteman.png',
//                                     // rating: 5,
//                                     date: 'Monday, May 12',
//                                     time: '11:00 - 12:00 AM'),
//                               );
//                             },
//                           ),
//                         ),
//                         Positioned(
//                           left: 5,
//                           top: 0,
//                           //right: 200,
//                           bottom: 0,
//                           child: GestureDetector(
//                               onTap: () {
//                                 if (pageControllerdoctor.hasClients) {
//                                   pageControllerdoctor.previousPage(
//                                     duration: Duration(milliseconds: 800),
//                                     curve: Curves.easeInOut,
//                                   );
//                                 }
//                               },
//                               child: Icon(
//                                 Icons.arrow_back_ios,
//                                 color: Colors.white,
//                                 size: 20,
//                               )),
//                         ),
//                         Positioned(
//                           right: 5,
//                           top: 0,
//                           bottom: 0,
//                           child: GestureDetector(
//                               onTap: () {
//                                 if (pageControllerdoctor.hasClients) {
//                                   pageControllerdoctor.nextPage(
//                                     duration: Duration(milliseconds: 800),
//                                     curve: Curves.easeInOut,
//                                   );
//                                 }
//                               },
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color: Colors.white,
//                                 size: 20,
//                               )),
//                         ),
//                       ],
//                     ))
//               ],
//             ),
//     );
//   }
// }
