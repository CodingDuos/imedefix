import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/d_offer_info_expension_tile.dart';
import 'package:idaawee/commons/common_widgets/d_offer_info_text_field.dart';
import 'package:idaawee/commons/common_widgets/d_offer_select_service.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

// ignore: must_be_immutable
class DLabOfferInfoSection extends StatelessWidget {
  GlobalKey<FormState> formKey;

  DLabOfferInfoSection({super.key, required this.formKey});
  var titleController = TextEditingController();
  var informationController = TextEditingController();
  var aboutController = TextEditingController();
  var addressController = TextEditingController();
  var expectedPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              offerInfo,
              style: getMediumStyle(
                  color: MyColors.pharmacytextColor, fontSize: MyFonts.size16),
            ),
            padding15,
            DOfferInfoTextField(
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your title';
                }
                return null;
              },
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
            const DOfferSelectService(),
            padding15,
            DOfferInfoTextFieldMaxLine(
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your information';
                }
                return null;
              },
              texfieldHeight: 54.h,
              controller: informationController,
              hintText: enterOfferdescription,
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: information,
              maxLines: 4,
            ),
            padding15,
            DOfferInfoTextFieldMaxLine(
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your about';
                }
                return null;
              },
              texfieldHeight: 54.h,
              controller: aboutController,
              hintText: enterOfferdescription,
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: about,
              maxLines: 6,
            ),
            padding15,
            DOfferInfoTextField(
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your lab address';
                }
                return null;
              },
              texfieldHeight: 54.h,
              controller: addressController,
              hintText: enterHospitalAddress,
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: labaddress,
              subTitle: '',
            ),
            padding15,
            const DOfferInfoExpensionTile(),
            padding15,
          ],
        ),
      ),
    );
  }
}
