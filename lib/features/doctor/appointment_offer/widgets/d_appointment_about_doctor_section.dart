import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/d_offer_info_available_time.dart';
import 'package:idaawee/commons/common_widgets/d_lab_appointment_pharmacy_text_field.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

// ignore: must_be_immutable
class DAppointmentAboutDoctorSection extends StatelessWidget {
  DAppointmentAboutDoctorSection({super.key});
  var titleController = TextEditingController();
  var departmentController = TextEditingController();
  var insituteController = TextEditingController();
  var expectedPriceController = TextEditingController();
  List<String> availableTimeList = [
    '8:30PM',
    '9:30PM',
    '10:30PM',
    '11:30PM',
    'More',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            abouttheDoctor,
            style: getSemiBoldStyle(
                color: MyColors.black, fontSize: MyFonts.size16),
          ),
          padding15,
          DLabAppointmentPharmactTextField(
            texfieldHeight: 54.h,
            controller: titleController,
            hintText: enterOfferTitle,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: title,
            subTitle: '',
          ),
          padding15,
          DLabAppointmentPharmactTextField(
            texfieldHeight: 54.h,
            controller: departmentController,
            hintText: enterdepartment,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: department,
            subTitle: '',
          ),
          padding15,
          DLabAppointmentPharmactTextField(
            texfieldHeight: 54.h,
            controller: insituteController,
            hintText: enterinstitute,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: institute,
            subTitle: '',
          ),
          padding15,
          DLabAppointmentPharmactTextField(
            texfieldHeight: 54.h,
            controller: expectedPriceController,
            hintText: entertotalprice,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: expectedprice,
            subTitle: '',
          ),
          padding15,
          DOfferInfoAvailableTime(
            availableTimeList: availableTimeList,
          ),
          padding15,
        ],
      ),
    );
  }
}
