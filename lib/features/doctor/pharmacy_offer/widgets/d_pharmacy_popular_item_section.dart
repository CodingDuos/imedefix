import 'dart:io';

import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/d_offer_info_text_field.dart';
import 'package:idaawee/features/doctor/pharmacy_offer/widgets/d_pharmacy_payment_expension.dart';
import 'package:idaawee/features/doctor/pharmacy_offer/widgets/d_pharmacy_popular_upload_pic_card.dart';
import 'package:idaawee/features/doctor/pharmacy_offer/widgets/d_pharmacy_prescription_expension.dart';
import 'package:idaawee/commons/common_widgets/upload_bottom_sheet_section.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class DPharmacyPopularItemSection extends StatefulWidget {
  DPharmacyPopularItemSection({
    super.key,
  });

  @override
  State<DPharmacyPopularItemSection> createState() =>
      _DPharmacyPopularItemSectionState();
}

class _DPharmacyPopularItemSectionState
    extends State<DPharmacyPopularItemSection> {
  var productNameController = TextEditingController();

  var productPriceController = TextEditingController();

  var shippingTimeController = TextEditingController();

  var aboutProductController = TextEditingController();

  var productQuantityController = TextEditingController();

  File? imageFile;

  var picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            popularItem,
            style: getSemiBoldStyle(
                color: MyColors.black, fontSize: MyFonts.size16),
          ),
          Text(
            itemPicture,
            style: getSemiBoldStyle(
                color: MyColors.checkboxColor, fontSize: MyFonts.size14),
          ),
          DPharmacyPopularUploadPicCard(
            onTap: () {
              _displayBottomSheet(
                context: context,
                camera: () {
                  _getImage(ImageSource.camera);
                },
                gallery: () {
                  _getImage(ImageSource.gallery);
                },
              );
            },
          ),
          padding15,
          DOfferInfoTextField(
            validatorFn: (value) {
              if (value!.isEmpty) {
                return 'Please enter your product name';
              }
              return null;
            },
            texfieldHeight: 54.h,
            controller: productNameController,
            hintText: productname,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: productname,
            subTitle: '',
          ),
          padding15,
          DOfferInfoTextField(
            validatorFn: (value) {
              if (value!.isEmpty) {
                return 'Please enter your product price';
              }
              return null;
            },
            texfieldHeight: 54.h,
            controller: productPriceController,
            hintText: itemprice,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: itemprice,
            subTitle: '',
          ),
          padding15,
          const DPharmacyPrescriptionExpension(),
          padding15,
          DOfferInfoTextField(
            validatorFn: (value) {
              if (value!.isEmpty) {
                return 'Please enter your shipping time';
              }
              return null;
            },
            texfieldHeight: 54.h,
            controller: shippingTimeController,
            hintText: shippingtimewithin2days,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: shippingtime,
            subTitle: '',
          ),
          padding15,
          const DPharmacyPaymentExpensionTile(),
          padding15,
          DOfferInfoTextFieldMaxLine(
            validatorFn: (value) {
              if (value!.isEmpty) {
                return 'Please enter your about product';
              }
              return null;
            },
            texfieldHeight: 54.h,
            controller: aboutProductController,
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
                return 'Please enter your product quantity';
              }
              return null;
            },
            texfieldHeight: 54.h,
            controller: productQuantityController,
            hintText: nofiteminrestock,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
            obscure: false,
            label: nofiteminrestock,
            subTitle: '',
          ),
        ],
      ),
    );
  }

  _getImage(ImageSource source) async {
    var pickedFile = await picker.pickImage(
      source: source,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future _displayBottomSheet(
      {required BuildContext context,
      required Function() camera,
      required Function() gallery}) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (_) => UploadBottomSheetSection(
              title: uploaditempicture,
              camera: camera,
              gallery: gallery,
            ));
  }
}
