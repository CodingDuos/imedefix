import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/features/doctor/become_a_doctor/widgets/d_become_other_details_section.dart';
import 'package:idaawee/features/doctor/become_a_doctor/widgets/d_upload_your_certificate_section.dart';
import 'package:idaawee/features/doctor/become_a_doctor/widgets/d_upload_your_image_section.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import '../../../../../commons/common_widgets/d_common_appbar.dart';

class BecomeADoctorScreen extends StatelessWidget {
  const BecomeADoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DCommonAppBar(
          appBarTitle: becomeadoctor,
          onTap: () {
            Navigator.pop(context);
          }),
      body: SizedBox(
        height: 812.h,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
                  child: Text(
                    pleaseFilltheformcarefully,
                    style: getMediumStyle(
                        color: MyColors.pharmacytextColor,
                        fontSize: MyFonts.size18),
                  ),
                ),
                const DUploadYourImageSection(),
                padding15,
                const DUploadYourCertificateSection(),
                padding15,
                const DBecomeOtherDetailsSection(),
                padding50,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.pendingApprovelScreen,
                          arguments: {
                            'approvel': approved,
                          });
                    },
                    buttonText: submiforreview,
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
