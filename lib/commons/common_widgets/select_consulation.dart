import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

// ignore: must_be_immutable
class SelectConsulation extends StatefulWidget {
  const SelectConsulation({
    super.key,
  });

  @override
  State<SelectConsulation> createState() => _SelectConsulationState();
}

class _SelectConsulationState extends State<SelectConsulation> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              index = 0;
            });
          },
          child: Container(
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: MyColors.lightContainerColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      index == 0
                          ? Container(
                              height: 14.h,
                              width: 14.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: MyColors.appColor),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: MyColors.appColor,
                                ),
                              ),
                            )
                          : Container(),
                      const SizedBox(width: 5),
                      Text(
                        self,
                        style: getSemiBoldStyle(
                            color: MyColors.accountTypeTextColor,
                            fontSize: MyFonts.size14),
                      )
                    ],
                  ),
                  //
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {
            setState(() {
              index = 1;
            });
          },
          child: Container(
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: MyColors.lightContainerColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      index == 1
                          ? Container(
                              height: 14.h,
                              width: 14.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: MyColors.appColor),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: MyColors.appColor,
                                ),
                              ),
                            )
                          : Container(),
                      const SizedBox(width: 5),
                      Text(
                        familymember,
                        style: getSemiBoldStyle(
                            color: MyColors.accountTypeTextColor,
                            fontSize: MyFonts.size14),
                      )
                    ],
                  ),
                  //
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {
            setState(() {
              index = 2;
            });
          },
          child: Container(
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: MyColors.lightContainerColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      index == 2
                          ? Container(
                              height: 14.h,
                              width: 14.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: MyColors.appColor),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: MyColors.appColor,
                                ),
                              ),
                            )
                          : Container(),
                      const SizedBox(width: 5),
                      Text(
                        other,
                        style: getSemiBoldStyle(
                            color: MyColors.accountTypeTextColor,
                            fontSize: MyFonts.size14),
                      )
                    ],
                  ),
                  //
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
