
import 'package:flutter/material.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_rectangular_cached_network_image.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/commons/common_widgets/triangle_widget.dart';

import 'package:idaawee/utils/constants/font_manager.dart';

class DConsultationCard extends StatelessWidget {
  final String image;
  final String name;
  final String bannertitle;
  final double rating;
  final String description;
  final VoidCallback onEditTap;

  const DConsultationCard({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.description,
    required this.bannertitle, required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        children: [
          Container(
            height: 152.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: const Color(0xffE5E9EB)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedRectangularNetworkImageWidget(
                  height: 152,
                  width: 136,
                  image: image,
                ),
                SizedBox(width: 15.w,),
                Padding(
                  padding: EdgeInsets.only(right: 20.w, top: 20.h, bottom: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth:  162.w,
                          maxHeight: 48.h
                        ),
                        child: Text(name,
                            style: getMediumStyle(
                                color: MyColors.black,
                                fontSize: MyFonts.size18)),
                      ),

                      Container(
                        constraints: BoxConstraints(
                          maxWidth:  162.w,
                          maxHeight: 48.h
                        ),
                        child: Text(description,
                            style: getRegularStyle(
                                color: MyColors.textLightColor,
                                fontSize: MyFonts.size12)),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                              onPressed: onEditTap,
                              buttonText: 'Edit Offer',
                            buttonHeight: 20.h,
                            buttonWidth: 95.w,
                            textStyle: getRegularStyle(
                              color: MyColors.whiteColor,
                              fontSize: MyFonts.size10
                            ),
                          ),
                          SizedBox(width: 30.w,),
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
                                      color: MyColors.black,
                                      fontSize: MyFonts.size16)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomTriangleCard(
            color: MyColors.themeOrangeColor,
            bannerText: bannertitle,
          ),
        ],
      ),
    );
  }
}
