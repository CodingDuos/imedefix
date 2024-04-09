// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/home%20copy/view/user_next_appointment_screen.dart';
import 'package:idaawee/features/doctor/home/widgets/d_next_appointment_card.dart';
import 'package:idaawee/features/user/home/widget/u_doctor_consulation_card.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/user_all_speciallist.dart';
import 'package:idaawee/features/user/user_main_menu/controller/main_menu_controller.dart';
import 'package:idaawee/features/user/user_notification/widget/u_notification_card.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_home_provider.dart';
import 'package:idaawee/providers/user_providers/notification_provider.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/confrom_oppointment_model.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/get_doctor_book_oppointment.dart';
import 'package:idaawee/universal_models/user_models/get_user_book_appointment_model.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../../utils/constants/app_constants.dart';

class DNextAppointmentWidget extends StatefulWidget {
  @override
  State<DNextAppointmentWidget> createState() => _DNextAppointmentWidgetState();
}

class _DNextAppointmentWidgetState extends State<DNextAppointmentWidget> {
  final DoctorIndHomeProvider controller =
      Get.put(DoctorIndHomeProvider(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next Appointments',
            style: getBoldStyle(
              color: MyColors.textColor,
              fontSize: MyFonts.size16,
            ),
          ),
          SizedBox(
            child: Obx(
              () {
                final details =
                    doctorcontroller.SpecificDoctorDetailsList.first!;
                final appointments = controller.Doctorbookappointmentlist.value;
                return appointments.isEmpty
                    ? UDoctorNextAppointmentCard(
                        onTap: () {
                          ConformOppointmentModel model =
                              ConformOppointmentModel(id: '0');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserNextAppointmenyScreen(
                                        specialist: 'Dentist',
                                        DoctorName: 'Ikram Khan',
                                        id: 'id',
                                        PatientNames: 'name',
                                        sletedDate: 'formattedDate',
                                        model: model,
                                        seltedTime: "thursday",
                                      )));
                        },
                        name: 'Dr. ${details.name.toString()}',
                        specialist: details.specialization.toString(),
                        image: 'assets/images/whiteman.png',
                        // rating: 5,
                        date: 'No appointment Found',
                        time: DateFormat('yyyy-MM-dd')
                            .format(DateTime.now())
                            .toString(),
                        id: '',
                        model: null,
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: appointments.length,
                        padding: EdgeInsets.only(top: 10),
                        itemBuilder: (context, index) {
                          final appointmentDetails =
                              appointments[index].appointmentDetails;
                          final patientDetails =
                              appointments[index].patietnDetails;

                          ConformOppointmentModel model =
                              ConformOppointmentModel(
                            id: appointmentDetails!.sId.toString(),
                            bookingDate:
                                appointmentDetails.bookingDate.toString(),
                            fees: appointmentDetails.fees.toString(),
                            bookingFor:
                                appointmentDetails.bookingFor.toString(),
                            docId: appointmentDetails.docId.toString(),
                            gender: appointmentDetails.gender.toString(),
                            patientAge:
                                appointmentDetails.patientAge.toString(),
                            selectedDate:
                                appointmentDetails.selectedDate.toString(),
                            selectedTimeSlot:
                                appointmentDetails.selectedTimeSlot.toString(),
                            userId: appointmentDetails.userId.toString(),
                          );

                          return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: UDoctorNextAppointmentCard(
                                id: appointmentDetails.sId.toString(),
                                model: model,
                                date: appointmentDetails.selectedDate
                                        ?.toString() ??
                                    'N/A',
                                time: appointmentDetails.selectedTimeSlot ??
                                    'N/A',
                                name: patientDetails?.username?.toString() ??
                                    'Unknown Doctor',
                                specialist:
                                    '', // Add appropriate value or logic
                                image: 'assets/images/im1.png',
                                onTap: () {},
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
