import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/commons/common_widgets/d_category_section.dart';
import 'package:idaawee/commons/common_widgets/d_uniqe_selling_point_section.dart';
import 'package:idaawee/features/doctor/labtest_offer/widgets/d_lab_offer_about_doctor_section.dart';
import 'package:idaawee/features/doctor/labtest_offer/widgets/d_lab_offer_info_section.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../../commons/common_widgets/d_common_appbar.dart';

class DoctorLabTestOfferScreen extends ConsumerWidget {
  DoctorLabTestOfferScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DCommonAppBar(
          appBarTitle: createOffer,
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
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                child: Text(
                  pleaseFilltheformcarefully,
                  style: getMediumStyle(
                      color: MyColors.pharmacytextColor,
                      fontSize: MyFonts.size18),
                ),
              ),
              const DCategorySection(
                categories: [virus, chronic, screening, radiology],
              ),
              padding15,
              DLabOfferInfoSection(
                formKey: _formKey,
              ),
              padding15,
              DLabOfferAboutDoctorSection(),
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
                            'msg': yourLabtestofferhasbeensuccessfullyposted
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
            ],
          ),
        ),
      ),
    );
  }
}
