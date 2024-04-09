import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/common_app_bar.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/commons/common_widgets/d_category_section.dart';
import 'package:idaawee/commons/common_widgets/d_uniqe_selling_point_section.dart';
import 'package:idaawee/features/doctor/appointment_offer/widgets/d_appointment_about_doctor_section.dart';
import 'package:idaawee/features/doctor/appointment_offer/widgets/d_appointment_offer_info_section.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DoctorAppointmentOfferScreen extends StatelessWidget {
  DoctorAppointmentOfferScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        appBarTitle: createOffer,
      ),
      body: SizedBox(
        height: 812.h,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  child: Text(
                    pleaseFilltheformcarefully,
                    style: getMediumStyle(
                        color: MyColors.pharmacytextColor,
                        fontSize: MyFonts.size18),
                  ),
                ),
                const DCategorySection(
                  categories: [lungs, cardio, neuro],
                ),
                padding15,
                DAppointmentOfferInfoSection(
                  formKey: _formKey,
                ),
                padding15,
                DAppointmentAboutDoctorSection(),
                padding15,
                DUniqeSellingPointSection(),
                padding20,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                            context, AppRoutes.offerSuccessfullScreen,
                            arguments: {
                              'msg':
                                  yourAppointmentofferhasbeensuccessfullyposted
                            });
                      }
                    },
                    buttonText: publishOffer,
                    borderRadius: 10.r,
                    textStyle: getBoldStyle(
                        color: MyColors.white, fontSize: MyFonts.size22),
                  ),
                ),
                padding20,
              ]),
        ),
      ),
    );
  }
}
