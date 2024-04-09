import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class ShareDocumentWidget extends StatelessWidget {
  const ShareDocumentWidget(
      {super.key, required this.shareWith, required this.documents});

  final String shareWith;
  final int documents;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142.h,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: MyColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Share Documents',
                style: getBoldStyle(
                    color: MyColors.black, fontSize: MyFonts.size16)),
            padding10,
            Row(
              children: [
                Container(
                  height: 75.h,
                  width: 81.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: MyColors.lightgrey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.bloodRep,
                        height: 43.h,
                        width: 43.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blood Report',
                      style: getBoldStyle(
                          color: MyColors.black, fontSize: MyFonts.size18),
                    ),
                    padding3,
                    Text(
                      'Share with $shareWith',
                      style: getSemiBoldStyle(
                          color: MyColors.appColor, fontSize: MyFonts.size14),
                    ),
                    padding3,
                    Text(
                      '$documents Documents',
                      style: getSemiBoldStyle(
                          color: MyColors.grey, fontSize: MyFonts.size14),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
