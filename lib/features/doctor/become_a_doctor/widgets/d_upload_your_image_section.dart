import 'dart:io';

import 'package:flutter/material.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/upload_bottom_sheet_section.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:image_picker/image_picker.dart';

class DUploadYourImageSection extends StatefulWidget {
  const DUploadYourImageSection({super.key});

  @override
  State<DUploadYourImageSection> createState() =>
      _DUploadYourImageSectionState();
}

class _DUploadYourImageSectionState extends State<DUploadYourImageSection> {
  File? imageFile;

  var picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            uploadYourImage,
            style: getSemiBoldStyle(
                color: MyColors.black, fontSize: MyFonts.size16),
          ),
          padding15,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                uploadpicture,
                style: getSemiBoldStyle(
                    color: MyColors.checkboxColor, fontSize: MyFonts.size14),
              ),
              InkWell(
                onTap: () {
                  _displayBottomSheet(
                    context: context,
                    camera: () {
                      _getImage(ImageSource.camera).then((value) {
                        Navigator.pop(context);
                      });
                    },
                    gallery: () {
                      _getImage(ImageSource.gallery).then((value) {
                        Navigator.pop(context);
                      });
                    },
                  );
                },
                child: Container(
                  height: 154.h,
                  width: 154.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: MyColors.loginScreenTextColor.withOpacity(0.16),
                    ),
                  ),
                  child: imageFile == null
                      ? Center(
                          child: Padding(
                              padding: const EdgeInsets.all(65.0),
                              child: Image.asset(
                                AppAssets.add,
                                height: 24,
                                color: MyColors.checkboxColor,
                              )),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.file(
                            imageFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ],
          )
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
