import 'dart:io';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/upload_bottom_sheet_section.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:image_picker/image_picker.dart';

class DUploadYourCertificateSection extends StatefulWidget {
  const DUploadYourCertificateSection({super.key});

  @override
  State<DUploadYourCertificateSection> createState() =>
      _DUploadYourCertificateSectionState();
}

class _DUploadYourCertificateSectionState
    extends State<DUploadYourCertificateSection> {
  List<XFile> _selectedImages = [];

  var picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            uploadYourcertificate,
            style: getSemiBoldStyle(
                color: MyColors.black, fontSize: MyFonts.size16),
          ),
          padding15,
          _selectedImages.isEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      uploadcertificatepicture,
                      style: getSemiBoldStyle(
                          color: MyColors.checkboxColor,
                          fontSize: MyFonts.size14),
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
                            _getMultiImage().then((value) {
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
                            color:
                                MyColors.loginScreenTextColor.withOpacity(0.16),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(65.0),
                            child: Image.asset(
                              AppAssets.add,
                              height: 24,
                              color: MyColors.checkboxColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  height: 155.h,
                  child: ListView.builder(
                      itemCount: _selectedImages.length + 1,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == _selectedImages.length) {
                          return InkWell(
                            onTap: () {
                              _displayBottomSheet(
                                context: context,
                                camera: () {
                                  _getImage(ImageSource.camera).then((value) {
                                    Navigator.pop(context);
                                  });
                                },
                                gallery: () {
                                  _getMultiImage().then((value) {
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
                                  color: MyColors.loginScreenTextColor
                                      .withOpacity(0.16),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(65.0),
                                  child: Image.asset(
                                    AppAssets.add,
                                    height: 24,
                                    color: MyColors.checkboxColor,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Stack(
                            children: [
                              Container(
                                height: 154.h,
                                width: 154.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color: MyColors.loginScreenTextColor
                                        .withOpacity(0.16),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.r),
                                  child: Image.file(
                                    File(
                                      _selectedImages[index].path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 5,
                                  top: 5,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedImages.removeAt(index);
                                      });
                                    },
                                    child: Icon(
                                      Icons.close,
                                      size: 18.h,
                                      color: MyColors.red,
                                    ),
                                  )),
                            ],
                          ),
                        );
                      }),
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
        _selectedImages = [pickedFile];
      });
    }
  }

  _getMultiImage() async {
    List<XFile>? pickedFile = await picker.pickMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );
    // ignore: unnecessary_null_comparison
    if (pickedFile != null && pickedFile.isNotEmpty) {
      setState(() {
        _selectedImages = pickedFile;
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
