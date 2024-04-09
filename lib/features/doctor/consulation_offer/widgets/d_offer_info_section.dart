import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/d_offer_info_available_time.dart';
import 'package:idaawee/commons/common_widgets/d_offer_info_expension_tile.dart';
import 'package:idaawee/features/doctor/consulation_offer/widgets/d_offer_info_remind_you_befor.dart';
import 'package:idaawee/commons/common_widgets/d_offer_info_text_field.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

// ignore: must_be_immutable
class DOfferInfoSection extends StatelessWidget {
  GlobalKey<FormState> formKey;
  DOfferInfoSection({super.key, required this.formKey});

  var titleController = TextEditingController();
  var aboutController = TextEditingController();
  var addressController = TextEditingController();
  var expectedPriceController = TextEditingController();
  List<String> availableTimeList = [
    '1 PM',
    '2 PM',
    '3 PM',
    '4 PM',
    'More',
  ];

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
            DOfferInfoTextFieldMaxLine(
                validatorFn: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your about';
                  }
                  return null;
                },
                maxLines: 6,
                controller: aboutController,
                hintText: enterOfferdescription,
                onChanged: (value) {},
                onFieldSubmitted: (value) {},
                obscure: false,
                label: about),
            padding15,
            DOfferInfoTextField(
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
              texfieldHeight: 54.h,
              controller: addressController,
              hintText: entercalllink,
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              obscure: false,
              label: address,
              subTitle: '',
            ),
            padding15,
            const DOfferInfoExpensionTile(),
            padding15,
            DOfferInfoTextField(
              validatorFn: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your expected price';
                }
                return null;
              },
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
            const DOfferInfoRemainYouBefore(),
          ],
        ),
      ),
    );
  }
}
