import 'package:flutter/material.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_rectangular_cached_network_image.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';

import 'package:idaawee/utils/constants/font_manager.dart';

class DAppointmentCard extends StatelessWidget {
  final String image;
  final String name;
  final double rating;
  final String description;
  final VoidCallback onEditTap;

  const DAppointmentCard({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.description,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152.h,
      width: 335.w,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xffE5E9EB)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.w, top: 10.h, bottom: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 162.w, maxHeight: 48.h),
                  child: Text(name,
                      style: getMediumStyle(
                          color: MyColors.black, fontSize: MyFonts.size18)),
                ),
                padding6,
                Container(
                  constraints: BoxConstraints(maxWidth: 162.w, maxHeight: 48.h),
                  child: Text(description,
                      style: getRegularStyle(
                          color: MyColors.textLightColor,
                          fontSize: MyFonts.size12)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: MyColors.themeOrangeColor,
                      size: 17.h,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(rating.toString(),
                        style: getSemiBoldStyle(
                            color: MyColors.black, fontSize: MyFonts.size16)),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  onPressed: onEditTap,
                  buttonText: 'Edit Offer',
                  buttonHeight: 20.h,
                  buttonWidth: 95.w,
                  padding: 0,
                  textStyle: getRegularStyle(
                      color: MyColors.whiteColor, fontSize: MyFonts.size10),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          CachedRectangularNetworkImageWidget(
            height: 152,
            width: 136,
            image: image,
          ),
        ],
      ),
    );
  }
}
