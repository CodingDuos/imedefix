// ignore_for_file: deprecated_member_use

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_app_bar.dart';
import 'package:idaawee/commons/common_widgets/u_common_record_card.dart';
import 'package:idaawee/features/doctor/home%20copy/widget/u_doctor_consulation_card.dart';
import 'package:idaawee/features/user/record_screen/view/appointment_detail_screen.dart';
import 'package:idaawee/features/user/user_main_menu/controller/main_menu_controller.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/confrom_oppointment_model.dart';
import 'package:idaawee/universal_models/user_models/get_user_book_appointment_model.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:intl/intl.dart';

class RecordScreen extends ConsumerWidget {
  RecordScreen({super.key});

  final controller = Get.put(UserHomeScreenProvider());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        final mainMenuCtr = ref.watch(mainMenuProvider);

        mainMenuCtr.setIndex(0);
        return true;
      },
      child: Scaffold(
          appBar: CommonAppBar(isBackButton: false, appBarTitle: 'Record'),
          resizeToAvoidBottomInset: false,
          body: Container(
            height: 812.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.homeBg),
                fit: BoxFit.cover,
              ),
            ),
            child: StreamBuilder<List<GetUserBookAppointmentsModel>>(
              stream: controller.appointmentsStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("SNAPSHORT ERROR Try Again"),
                  );
                } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return Center(
                    child: Text("No Record Found"),
                  );
                } else if (snapshot.hasData) {
                  final appointments = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: appointments.length,
                    padding: EdgeInsets.only(top: 10),
                    itemBuilder: (context, index) {
                      final appointmentDetails =
                          appointments[index].appointmentDetails;

                      final doctorDetails = appointments[index].doctorDetails;

                      ConformOppointmentModel model = ConformOppointmentModel(
                        id: appointmentDetails!.sId.toString(),
                        bookingDate: appointmentDetails.bookingDate.toString(),
                        fees: '',
                        bookingFor: '',
                        docId: appointmentDetails.docId.toString(),
                        gender: '',
                        patientAge: '',
                        selectedDate:
                            appointmentDetails.selectedDate.toString(),
                        selectedTimeSlot:
                            appointmentDetails.selectedTimeSlot.toString(),
                        userId: appointmentDetails.userId.toString(),
                      );

                      String dateString =
                          appointmentDetails.bookingDate.toString();

                      List<int> dateParts =
                          dateString.split('-').map(int.parse).toList();

                      DateTime dateTime =
                          DateTime(dateParts[0], dateParts[1], dateParts[2]);

                      String formattedDate =
                          DateFormat('EEEE-d-yyyy').format(dateTime);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: UCommonRecordCard(
                          image: doctorDetails!.image.toString(),
                          name: doctorDetails.name.toString(),
                          speciality: doctorDetails.specialization.toString(),
                          qualification: doctorDetails.education.toString(),
                          status: index == 0 || index == 1
                              ? AppAssets.silver
                              : AppAssets.gold,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AppointmentDetailScreen(
                                          Name: doctorDetails.name.toString(),
                                        )));
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text('USER  OPPOINTMENT NOT FOUNT '));
                }
              },
            ),
          )),
    );
  }
}
