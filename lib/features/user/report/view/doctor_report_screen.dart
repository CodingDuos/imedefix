import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:idaawee/features/user/report/widget/u_report_card_widget.dart';
import 'package:idaawee/providers/user_providers/user_report_provider.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/thems/my_colors.dart';
import 'package:idaawee/utils/thems/styles_manager.dart';
// Make sure to replace 'your_path' with the actual path to your widget
// Import other necessary packages or files you need, such as assets or styles

class DoctorReportScreen extends ConsumerStatefulWidget {
  const DoctorReportScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DoctorReportScreen> createState() => _UserReportScreenState();
}

class _UserReportScreenState extends ConsumerState<DoctorReportScreen> {
  int? expandedIndex;

  final controller = Get.put(UserReportprovider());

  @override
  Widget build(BuildContext context) {
    final List<String> text = ['Blood Report', 'CT Scan', 'MRI'];
    final List<String> image = [
      AppAssets.bloodRep,
      AppAssets.ctscan,
      AppAssets.mri
    ]; // Ensure these assets exist and are correctly referenced

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
          padding: EdgeInsets.only(top: 10.h),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: text.length,
          itemBuilder: (context, index) {
            // final doctorDetails = controller.UserallReport[index].doctorDetails;
            // final patientDetails = controller.UserallReport[index].prescription;

            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: UReportCardWidget(
                index: index,
                date: 'doctorDetails.conditionsTreated',
                documents: 1,
                title: 'patientDetails',
                img: AppAssets.bloodRep,
                isExpanded: expandedIndex == index,
                onTap: () {
                  setState(() {
                    if (expandedIndex == index) {
                      expandedIndex = null;
                    } else {
                      expandedIndex = index;
                    }
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
