import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../../utils/constants/assets_manager.dart';

class UReportStatusWidget extends StatefulWidget {
  const UReportStatusWidget({super.key});

  @override
  State<UReportStatusWidget> createState() => _UReportStatusWidgetState();
}

class _UReportStatusWidgetState extends State<UReportStatusWidget> {
  bool isCbc = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: MyColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
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
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CBC',
                          style: getBoldStyle(
                              color: MyColors.textColor,
                              fontSize: MyFonts.size18),
                        ),
                        padding4,
                        Text(
                          'Upload: 27 Sep 2023',
                          style: getSemiBoldStyle(
                              color: MyColors.grey, fontSize: MyFonts.size14),
                        )
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: const Divider(
                thickness: 1.5,
                color: MyColors.lightgrey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  img: AppAssets.download,
                  title: 'Download',
                  onTap: () {},
                ),
                Container(
                  height: 43.h,
                  width: 2.w,
                  color: MyColors.lightgrey,
                ),
                Card(
                  img: AppAssets.update,
                  title: 'Update',
                  onTap: () {},
                ),
                Container(
                  height: 43.h,
                  width: 2.w,
                  color: MyColors.lightgrey,
                ),
                Card(
                  img: AppAssets.delete,
                  title: 'Delete',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String img;
  final String title;
  final VoidCallback onTap;
  const Card(
      {super.key, required this.img, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            img,
            height: 22.h,
            width: 22.w,
          ),
          padding4,
          Text(
            title,
            style: getSemiBoldStyle(
                color: MyColors.grey, fontSize: MyFonts.size12),
          )
        ],
      ),
    );
  }
}
