import 'dart:io';

import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/providers/doctor_providers/doctor_office_provider/doctor_office_register_provider.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:image_picker/image_picker.dart';

class Office_BasicInformation extends StatefulWidget {
  Office_BasicInformation({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<Office_BasicInformation> createState() =>
      _Office_BasicInformationState();
}

class _Office_BasicInformationState extends State<Office_BasicInformation> {
  final contoller = Get.put(DoctorOfficeRegisterProvider());
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the state with the new image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 1.sw,
          height: 600,
          decoration: const BoxDecoration(
            color: MyColors.lightBg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  padding64,
                  CustomTextField(
                    validatorFn: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    texfieldHeight: 60.h,
                    controller: contoller.d_office_officeName.value,
                    hintText: 'Office Name',
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    obscure: false,
                    label: '',
                    subTitle: '',
                  ),
                  padding15,
                  CustomTextField(
                    validatorFn: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    texfieldHeight: 60.h,
                    controller: contoller.d_office_officeEmail.value,
                    hintText: 'Office Email',
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    obscure: false,
                    label: '',
                    subTitle: '',
                  ),
                  padding15,
                  CustomTextField(
                    validatorFn: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    texfieldHeight: 60.h,
                    controller: contoller.d_office_officeNumber.value,
                    hintText: 'Office Contact Number',
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    obscure: false,
                    label: '',
                    subTitle: '',
                  ),
                  padding15,
                  CustomTextField(
                    borderRadius: 12,
                    maxLines: 3,
                    validatorFn: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    texfieldHeight: 60.h,
                    controller: contoller.d_office_about_office.value,
                    hintText: 'Office Website (Optional)',
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    obscure: false,
                    label: '',
                    subTitle: '',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Max 100 Words',
                          style: getSemiBoldStyle(
                              color: MyColors.grey, fontSize: MyFonts.size14),
                        ),
                      ],
                    ),
                  ),
                  NextButton(
                    back: () {},
                    text: 'Next',
                    isbackbuton: true,
                    onPressed: widget.onPressed,
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -60,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 70.w,
            backgroundColor: MyColors.lightBg,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: MyColors.grey.withOpacity(0.20),
              child: _image == null
                  ? Text(
                      'Add\nPhoto',
                      textAlign: TextAlign.center,
                      style: getSemiBoldStyle(
                          color: MyColors.grey, fontSize: MyFonts.size14),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.file(
                        _image!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 230,
          child: GestureDetector(
            onTap: _pickImage, // Call the function to pick an image
            child: Container(
              alignment: Alignment.center,
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.withOpacity(0.9)),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
