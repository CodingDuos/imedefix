import 'package:flutter/widgets.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';

import '../../../../commons/common_functions/padding.dart';
import '../../../../utils/constants/font_manager.dart';

class UStatusCard extends StatefulWidget {
  final String title;
  final String date;

  const UStatusCard({super.key, required this.title, required this.date});

  @override
  State<UStatusCard> createState() => _UStatusCardState();
}

class _UStatusCardState extends State<UStatusCard> {
  bool isCbc = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: MyColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 48.h,
                  width: 52.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: MyColors.lightgrey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.pdf,
                        height: 28.h,
                        width: 26.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 14.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: getBoldStyle(
                          color: MyColors.textColor, fontSize: MyFonts.size18),
                    ),
                    padding4,
                    Text(
                      'Upload: ${widget.date}',
                      style: getSemiBoldStyle(
                          color: MyColors.grey, fontSize: MyFonts.size14),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCbc = !isCbc;
                });
              },
              child: CircleAvatar(
                radius: 13.r,
                backgroundColor: MyColors.lightgrey,
                child: CircleAvatar(
                  radius: 9.r,
                  backgroundColor:
                      isCbc ? MyColors.appColor : MyColors.lightgrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
