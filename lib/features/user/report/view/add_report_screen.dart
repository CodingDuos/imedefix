import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_app_bar.dart';
import 'package:idaawee/features/user/report/widget/u_upload_card.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/add_resport_provider.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../../commons/common_widgets/CustomTextFields.dart';
import '../../../../utils/constants/assets_manager.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({Key? key}) : super(key: key);

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final controller = Get.put(AddReportProvider());
  // Default value for the dropdown
  List<String> dropdownItems = [
    'CBC',
    'BMP',
    'CMP',
    'ESR'
  ]; // Items for the dropdown
  String items = '';

  Future<void> _pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );
      if (result != null) {
        setState(() {
          controller.setreportfile(File(result.files.first.path.toString()));
          controller.filePath = result.files.single.path;
        });
      } else {}
    } catch (e) {
      print("Error picking document: $e");
    }
  }

  int? seleted;
  void seleteditem(value) {
    setState(() {
      seleted = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        appBarTitle: 'Add Reports',
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              // Container(
              //   height: 200,
              //   child: controller.ComfromAppopintmentList.isEmpty
              //       ? Center(
              //           child: CircularProgressIndicator(),
              //         )
              //       : Obx(
              //           () => ListView.builder(
              //             padding: EdgeInsets.only(top: 10.h),
              //             shrinkWrap: true,
              //             physics: const BouncingScrollPhysics(),
              //             itemCount: controller.ComfromAppopintmentList.length,
              //             itemBuilder: (context, index) {
              //               final appointmentDetails = controller
              //                   .ComfromAppopintmentList[index]
              //                   .appointmentDetails;
              //               final patientDetails = controller
              //                   .ComfromAppopintmentList[index].patientDetails;

              //               // Printing for debug purposes - you might want to remove or comment out these lines.
              //               print(
              //                   "appointment details  ${patientDetails!.username}");
              //               print(
              //                   "appointment details  ${patientDetails.email}");
              //               print("appointment details  ${patientDetails.id}");

              //               return InkWell(
              //                 onTap: () {
              //                   controller.seletedPatientid(
              //                       patientDetails.id.toString());
              //                   seleteditem(index);
              //                 },
              //                 child: Padding(
              //                   padding: const EdgeInsets.only(bottom: 8),
              //                   child: Container(
              //                     alignment: Alignment.center,
              //                     height: 60.h,
              //                     decoration: BoxDecoration(
              //                       color: seleted == index
              //                           ? Colors
              //                               .blue // Color for the selected item
              //                           : MyColors.white,
              //                       borderRadius: BorderRadius.circular(5.r),
              //                     ),
              //                     child: Text(
              //                       patientDetails.username,
              //                       style: getBoldStyle(
              //                           color: MyColors.black,
              //                           fontSize: MyFonts.size16),
              //                     ),
              //                   ),
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              // ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                width: screenWidth * 0.95,
                child: DropdownButtonFormField<String>(
                  value: controller.dropdownValue,
                  onChanged: (value) {
                    setState(() {
                      controller.dropdownValue = value!;
                    });
                  },
                  isExpanded: true,
                  iconSize: 24,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    // Set the border side and color
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                        // Set the focused border color
                        width: 1,
                      ),
                    ),
                  ),
                  items: dropdownItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            color: value == controller.dropdownValue
                                ? Colors.grey
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              padding10,
              CustomTextField(
                radius: 5.r,
                controller: controller.reportController.value,
                hintText: 'Report Title',
                onChanged: (String) {},
                onFieldSubmitted: (String) {},
                obscure: false,
                label: 'Report Title',
                subTitle: '',
              ),
              padding16,
              UUploadCard(
                title: controller.filePath != null
                    ? controller.filePath
                    : "Upload File",
                onTap: _pickDocument,
              ),
              padding16,
              InkWell(
                onTap: () {
                  controller.AddDoctorRprot(context);
                },
                child: Container(
                  height: 55.h,
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: MyColors.appColor, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      'Upload',
                      style: getBoldStyle(
                        color: MyColors.appColor,
                        fontSize: MyFonts.size16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
