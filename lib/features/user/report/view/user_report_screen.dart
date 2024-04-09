import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:idaawee/features/user/report/widget/u_report_card_widget.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/add_resport_provider.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/get_doctor_report.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/thems/my_colors.dart';
import 'package:idaawee/utils/thems/styles_manager.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

// Make sure to replace 'your_path' with the actual path to your widget
// Import other necessary packages or files you need, such as assets or styles

class UserReportScreen extends ConsumerStatefulWidget {
  const UserReportScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserReportScreen> createState() => _UserReportScreenState();
}

class _UserReportScreenState extends ConsumerState<UserReportScreen> {
  int? expandedIndex;

  final controller = Get.put(getDoctorReportProvider());

  @override
  Widget build(BuildContext context) {
    final List<String> text = ['Blood Report', 'CT Scan', 'MRI'];
    final List<String> textfields = ['BloodReport', 'STscan', 'MRI'];
    final List<String> image = [
      AppAssets.bloodRep,
      AppAssets.ctscan,
      AppAssets.mri
    ]; // Ensure these assets exist and are correctly referenced

    final controller = Get.put(AddReportProvider());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff38B698).withOpacity(0.1),
        centerTitle: true,
        title: Text(
          'Reports',
          style: getSemiBoldStyle(
              color: MyColors.black94,
              fontSize: 20), // Make sure these style helpers exist
        ),
        actions: [
          IconButton(
            onPressed: () {
              // controller.GetConformAppointment(
              //     context, controller.docId.toString());

              Navigator.pushNamed(context, AppRoutes.addReportScreen);
            },
            icon: Image.asset(
              AppAssets.add,
              width: 20.w,
              height: 20.h,
              color: MyColors.black,
            ),
          ),
        ],
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg), // Make sure this asset exists
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(18),
          itemCount: text.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: UReportTypeCardWidgets(
                index: index,
                date: '19 Mar 2023',
                documents: index + 1,
                title: text[index],
                img: image[index],
                onTap: () {
                  String fileUrl =
                      'https://imdfx-newserver-production.up.railway.app/uploads/5b895e1c44e58fc94f3d38c5aee84014';
                  String filename =
                      'example'; // Provide the desired filename here
                  downloadFile(fileUrl, filename);
                  // controller.setSelectedReportType(textfields[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<void> downloadFile(String url, String filename) async {
  try {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var bytes = response.bodyBytes;

      var tempDir = await getTemporaryDirectory();

      var contentType = response.headers['content-type'];
      var extension =
          contentType != null ? contentType.split('/').last : 'unknown';
      var filePath = '${tempDir.path}/$filename.$extension';
      var file = File(filePath);
      await file.writeAsBytes(bytes);
    } else {
      print(
          'Failed to download file. Server responded with status code: ${response.statusCode}');
    }
  } catch (e) {
    // Exception occurred during the request
    print('Failed to download file: $e');
  }
}
