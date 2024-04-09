import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/features/user/home/widget/cancel_tabview.dart';
import 'package:idaawee/features/user/home/widget/complete_tabview.dart';
import 'package:idaawee/features/user/home/widget/upcoming_tabview.dart';

import '../../../../utils/constants/font_manager.dart';
import '../../../../utils/thems/my_colors.dart';
import '../../../../utils/thems/styles_manager.dart';

class UAppointTab extends StatelessWidget {
  const UAppointTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
          height: 520.h,
          width: 1.sw,
          decoration: BoxDecoration(
            color: MyColors.white.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              padding10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: MyColors.lightgrey,
                  ),
                  child: SegmentedTabControl(
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 4.w),
                    radius: Radius.circular(100.r),
                    backgroundColor: MyColors.lightgrey,
                    indicatorColor: Colors.orange.shade200,
                    tabTextColor: Colors.black45,
                    selectedTabTextColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: MyFonts.size14,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: const [
                      SegmentTab(
                        label: '   Upcoming',
                        gradient: LinearGradient(
                          colors: [
                            MyColors.appColor1,
                            MyColors.appColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      SegmentTab(
                        label: 'Completed    ',
                        gradient: LinearGradient(
                          colors: [
                            MyColors.appColor1,
                            MyColors.appColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      SegmentTab(
                        label: 'Cancelled',
                        gradient: LinearGradient(
                          colors: [
                            MyColors.appColor1,
                            MyColors.appColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                  child: TabBarView(
                children: [
                //  UpcomingTabView(),
                  CompleteTabView(),
                  CancelTabView(),
                ],
              ))
            ],
          )),
    );
  }
}

class TabCard extends StatelessWidget {
  final String title;
  const TabCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 113.w,
      decoration: BoxDecoration(
        color: MyColors.appColor,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Center(
          child: Text(
        title,
        style: getBoldStyle(color: MyColors.white, fontSize: MyFonts.size14),
      )),
    );
  }
}
