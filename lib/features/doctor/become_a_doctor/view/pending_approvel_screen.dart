import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../../commons/common_widgets/d_common_appbar.dart';

class PendingApprovelScreen extends StatelessWidget {
  final String approvel;
  const PendingApprovelScreen({super.key, required this.approvel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DCommonAppBar(
          appBarTitle: pendingApproval,
          onTap: () {
            Navigator.pop(context);
          }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.tickcircle,
            height: 42.h,
            width: 42.h,
          ),
          padding15,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.w),
            child: Text(
              approvel,
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(
                  color: MyColors.pharmacytextColor, fontSize: MyFonts.size18),
            ),
          ),
          padding15,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 39.w),
            child: CustomButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.loginScreen, (route) => false);
              },
              buttonText: done,
              borderRadius: 16.r,
              textStyle:
                  getBoldStyle(color: MyColors.white, fontSize: MyFonts.size14),
            ),
          ),
        ],
      ),
    );
  }
}
