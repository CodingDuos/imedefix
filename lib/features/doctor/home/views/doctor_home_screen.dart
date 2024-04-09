import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/home/widgets/d_home_appbar.dart';
import 'package:idaawee/features/doctor/home/widgets/d_my_appointments_section.dart';
import 'package:idaawee/features/doctor/home/widgets/d_my_consultation_section.dart';
import 'package:idaawee/features/doctor/home/widgets/d_my_lab_tests_section.dart';
import 'package:idaawee/features/doctor/home/widgets/d_my_pharmacy_section.dart';
import 'package:idaawee/features/doctor/home/widgets/d_next_oppointment_section.dart';
import 'package:idaawee/utils/constants/app_constants.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DHomeAppBar(
            profileImageLink: doctorImage,
            doctorName: 'Dr.Pawan',
            onMenuTap: () {},
          ),
          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  padding24,
                  DNextAppointmentSection(),
                  padding24,
                  DMyAppointmentSection(),
                  padding24,
                  DMyConsultationSection(),
                  padding24,
                  MyLabTestsSection(),
                  padding24,
                  DMyPharmacySection(),
                  padding40
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
