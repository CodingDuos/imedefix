
import 'package:flutter/cupertino.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DAppointmentTimeChain extends StatelessWidget {
  final bool isFirst;
  final String time;
  final String monthAndYear;
  const DAppointmentTimeChain({Key? key, required this.isFirst, required this.time, required this.monthAndYear}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: isFirst ? MyColors.themeOrangeColor: MyColors.borderColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: Column(
        children: [
          Text(time, style: getMediumStyle(
            color: isFirst ?  MyColors.whiteColor : MyColors.textColor,
            fontSize: MyFonts.size18
          ),),
          SizedBox(height: 5.h,),
          Text(monthAndYear, style: getMediumStyle(
              color: isFirst ?  MyColors.whiteColor : MyColors.textColor,
              fontSize: MyFonts.size12
          ),),
        ],
      ),
    );
  }
}
