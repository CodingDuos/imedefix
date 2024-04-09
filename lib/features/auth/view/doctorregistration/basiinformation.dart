// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/features/auth/view/doctor_registration.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_register_provider.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:image_picker/image_picker.dart';

class BasicInformation extends StatefulWidget {
  BasicInformation(
      {super.key, required this.onPressed, required this.onPressedback});
  final VoidCallback onPressed;
  final VoidCallback onPressedback;

  @override
  State<BasicInformation> createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  final TextEditingController namecontroller = TextEditingController();

  File? _image;
  // Variable to hold the picked image
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        controller.imagePath = _image!; // Update the state with the new image
      });
    }
  }

  final controller = Get.put(DoctorIndRegisterProvider());

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Container(
            width: 1.sw,
            // height: 800.h,
            decoration: const BoxDecoration(
              color: MyColors.lightBg,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    padding64,
                    CustomTextField(
                      validatorFn: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      texfieldHeight: 60.h,
                      controller: controller.d_ind_specialization.value,
                      hintText: 'Specialization',
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      obscure: false,
                      label: '',
                      subTitle: '',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      validatorFn: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      texfieldHeight: 60.h,
                      controller: controller.d_ind_condion_tretment.value,
                      hintText: 'Conditions Treated',
                      onChanged: (value) {},
                      onFieldSubmitted: (value) {},
                      obscure: false,
                      label: '',
                      subTitle: '',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),

                      height: 150, // Set the height of the container
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset.zero,
                            blurRadius: 2,
                          )
                        ],

                        border: Border.all(
                            color:
                                MyColors.loginScreenTextColor.withOpacity(0.16),
                            width: 1),
                        color: Colors
                            .white, // Set the background color of the container
                        borderRadius: BorderRadius.circular(
                            15), // Set the border radius of the container
                      ),
                      // Add some padding inside the container
                      child: TextField(
                        controller: controller.d_ind_about_yourself.value,
                        textAlign: TextAlign.start,
                        maxLines: 5, // Allows multiple lines of input
                        decoration: InputDecoration(
                          hintText: "Tell us about yourself",
                          border: InputBorder
                              .none, // Removes the underline of the input field
                          // Optionally, you can add more styling to the input decoration here
                        ),
                        // You can further customize the TextField (e.g., set a controller, style, etc.)
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                    SizedBox(
                      height: 10,
                    ),
                    NextButton(
                      back: () {
                        Navigator.of(context).pop();
                      },
                      text: 'Next',
                      isbackbuton: true,
                      onPressed: widget.onPressed,
                    )
                  ],
                ),
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
