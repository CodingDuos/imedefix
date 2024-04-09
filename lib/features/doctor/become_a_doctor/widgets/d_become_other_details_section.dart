import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/commons/common_widgets/d_offer_info_text_field.dart';
import 'package:idaawee/features/doctor/become_a_doctor/widgets/d_availibility_expension.dart';
import 'package:idaawee/features/doctor/become_a_doctor/widgets/d_experience_years_expension.dart';
import 'package:idaawee/features/doctor/become_a_doctor/widgets/d_work_online_expension.dart';

class DBecomeOtherDetailsSection extends StatefulWidget {
  const DBecomeOtherDetailsSection({super.key});

  @override
  State<DBecomeOtherDetailsSection> createState() =>
      _DBecomeOtherDetailsSectionState();
}

class _DBecomeOtherDetailsSectionState
    extends State<DBecomeOtherDetailsSection> {
  var doctotNameController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          DOfferInfoTextField(
            texfieldHeight: 54.h,
            controller: doctotNameController,
            hintText: enteryourname,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: doctorname,
            subTitle: '',
          ),
          padding4,
          CustomTextField(
              texfieldHeight: 54.h,
              controller: emailController,
              hintText: enteryouremailid,
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: doctorEmail,
              subTitle: ''),
          padding8,
          const DWorkOnlineExpension(),
          padding8,
          const DExperienceYearExpension(),
          padding8,
          const DAvailabilityExpension()
        ],
      ),
    );
  }
}
