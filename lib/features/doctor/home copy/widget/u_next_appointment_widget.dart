// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/home%20copy/view/user_next_appointment_screen.dart';
import 'package:idaawee/features/doctor/home%20copy/widget/u_doctor_consulation_card.dart';

import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/confrom_oppointment_model.dart';
import 'package:idaawee/universal_models/user_models/get_user_book_appointment_model.dart';

import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:intl/intl.dart';

class UNextAppointmentWidget extends StatefulWidget {
  const UNextAppointmentWidget({super.key, this.isdoctor = false});
  final bool isdoctor;

  @override
  State<UNextAppointmentWidget> createState() => _UNextAppointmentWidgetState();
}

class _UNextAppointmentWidgetState extends State<UNextAppointmentWidget> {
  bool isFavorite = false;
  PageController pageControlleruser = PageController(viewportFraction: 1);

  PageController pageControllerdoctor = PageController(viewportFraction: 1);
  final controller = Get.put(UserHomeScreenProvider());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5),
      child: widget.isdoctor == false
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 240.h,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      StreamBuilder<List<GetUserBookAppointmentsModel>>(
                        stream: controller.appointmentsStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("SNAPSHORT ERROR"),
                            );
                          } else if (snapshot.hasData &&
                              snapshot.data!.isEmpty) {
                            return UDoctorNextAppointmentCard(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    AppRoutes.userNextAppintmentScreen);
                              },
                              name: "Top OrDers Doctor",
                              specialist: "more info",
                              image: 'assets/images/whiteman.png',
                              // rating: 5,
                              date: 'No Appoitmnt Foun',
                              time: 'book now',
                            );
                          } else if (snapshot.hasData) {
                            final appointments = snapshot.data!;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: appointments.length,
                              padding: EdgeInsets.only(top: 10),
                              itemBuilder: (context, index) {
                                print(
                                    ' user oppointment  home screen calling =====>>>>>');
                                final appointmentDetails =
                                    appointments[index].appointmentDetails;

                                final doctorDetails =
                                    appointments[index].doctorDetails;

                                ConformOppointmentModel model =
                                    ConformOppointmentModel(
                                  id: appointmentDetails!.sId.toString(),
                                  bookingDate:
                                      appointmentDetails.bookingDate.toString(),
                                  fees: '',
                                  bookingFor: '',
                                  docId: appointmentDetails.docId.toString(),
                                  gender: '',
                                  patientAge: '',
                                  selectedDate: appointmentDetails.selectedDate
                                      .toString(),
                                  selectedTimeSlot: appointmentDetails
                                      .selectedTimeSlot
                                      .toString(),
                                  userId: appointmentDetails.userId.toString(),
                                );

                                String dateString =
                                    appointmentDetails.bookingDate.toString();

                                // Split the string date by '-' and convert to integers
                                List<int> dateParts = dateString
                                    .split('-')
                                    .map(int.parse)
                                    .toList();

                                // Create a DateTime object
                                DateTime dateTime = DateTime(
                                    dateParts[0], dateParts[1], dateParts[2]);

                                // Format the date
                                String formattedDate =
                                    DateFormat('EEEE-d-yyyy').format(dateTime);

                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: UDoctorNextAppointmentCard(
                                      date: formattedDate,
                                      time: appointmentDetails.selectedTimeSlot
                                          .toString(),
                                      name:
                                          'Doctor ${doctorDetails!.name.toString()}',
                                      specialist: doctorDetails.specialization
                                          .toString(),
                                      image: 'assets/images/im1.png',
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserNextAppointmenyScreen(
                                                      specialist: doctorDetails
                                                          .specialization
                                                          .toString(),
                                                      DoctorName: doctorDetails
                                                          .name
                                                          .toString(),
                                                      id: 'id',
                                                      PatientNames: 'name',
                                                      sletedDate: formattedDate,
                                                      model: model,
                                                      seltedTime:
                                                          appointmentDetails
                                                              .selectedTimeSlot
                                                              .toString(),
                                                    )));
                                      },
                                      //  model: ,
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                                child: Text('USER  OPPOINTMENT NOT FOUNT '));
                          }
                        },
                      ),
                      Positioned(
                        left: 10,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            if (pageControlleruser.hasClients) {
                              pageControlleruser.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        top: -0,
                        child: Text(
                          'Next Appointments',
                          style: getBoldStyle(
                              color: MyColors.textColor,
                              fontSize: MyFonts.size16),
                        ),
                      ),
                      Positioned(
                        right: -5,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            print('ssssssss');
                            if (pageControlleruser.hasClients) {
                              pageControlleruser.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Next Appointments',
                    style: getBoldStyle(
                        color: MyColors.textColor, fontSize: MyFonts.size16)),
                // const SizedBox(
                //   height: 10,
                // ),
                UDoctorNextAppointmentCard(
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.userNextAppintmentScreen);
                  },
                  name: "Alex Anderson",
                  specialist: "28 Years old",
                  image: 'assets/images/whiteman.png',
                  // rating: 5,
                  date: 'Monday, May 12',
                  time: '11:00 - 12:00 AM',
                ),
                SizedBox(
                    // height: 220.h,
                    // child: Stack(
                    //   children: [
                    //     SizedBox(
                    //       height: 220.h,
                    //       child: ListView.builder(
                    //         controller: pageControllerdoctor,
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: 4, // Assuming 10 items for demonstration
                    //         itemBuilder: (context, index) {
                    //           return Padding(
                    //             padding: EdgeInsets.symmetric(horizontal: 5),
                    //             child: UDoctorNextAppointmentCard(
                    //                 onTap: () {
                    //                   Navigator.pushNamed(context,
                    //                       AppRoutes.userNextAppintmentScreen);
                    //                 },
                    //                 name: "Alex Anderson",
                    //                 specialist: "Dentist Specialist",
                    //                 image: 'assets/images/whiteman.png',
                    //                 // rating: 5,
                    //                 date: 'Monday, May 12',
                    //                 time: '11:00 - 12:00 AM'),
                    //           );
                    //         },
                    //       ),
                    //     ),
                    //     Positioned(
                    //       left: 10,
                    //       top: 0,
                    //       //right: 200,
                    //       bottom: 0,
                    //       child: GestureDetector(
                    //           onTap: () {
                    //             if (pageControllerdoctor.hasClients) {
                    //               pageControllerdoctor.previousPage(
                    //                 duration: Duration(milliseconds: 800),
                    //                 curve: Curves.easeInOut,
                    //               );
                    //             }
                    //           },
                    //           child: Icon(
                    //             Icons.arrow_back_ios,
                    //             color: Colors.white,
                    //             size: 20,
                    //           )),
                    //     ),
                    //     Positioned(
                    //       right: -5,
                    //       top: 0,
                    //       bottom: 0,
                    //       child: GestureDetector(
                    //           onTap: () {
                    //             if (pageControllerdoctor.hasClients) {
                    //               pageControllerdoctor.nextPage(
                    //                 duration: Duration(milliseconds: 800),
                    //                 curve: Curves.easeInOut,
                    //               );
                    //             }
                    //           },
                    //           child: Icon(
                    //             Icons.arrow_forward_ios,
                    //             color: Colors.white,
                    //             size: 20,
                    //           )),
                    //     ),
                    //   ],
                    // ))
                    )
              ],
            ),
    );
  }
}
