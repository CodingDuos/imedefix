import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_circular_cached_network_image.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/features/doctor/home/widgets/d_lab_category_chip.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DMyLabTestCard extends StatelessWidget {
  final String doctorImage;
  final String doctorName;
  final String doctorOccupation;
  final String doctorSeniority;
  final String labName;
  final String labLocation;
  final List<String> labCategories;
  final VoidCallback onCardTap;
  const DMyLabTestCard(
      {Key? key,
      required this.doctorImage,
      required this.doctorName,
      required this.doctorOccupation,
      required this.doctorSeniority,
      required this.labName,
      required this.labLocation,
      required this.labCategories,
      required this.onCardTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165.h,
      width: 335.w,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xffE5E9EB)),
      ),
      padding: EdgeInsets.all(10.sp),
      child: Column(
        children: [
          Container(
            height: 84.h,
            decoration: BoxDecoration(
                color: MyColors.containerColor,
                borderRadius: BorderRadius.circular(16.r)),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Row(
              children: [
                CachedCircularNetworkImageWidget(image: doctorImage, size: 64),
                SizedBox(
                  width: 18.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      doctorName,
                      style: getMediumStyle(
                          color: MyColors.textColor, fontSize: MyFonts.size15),
                    ),
                    padding3,
                    Row(
                      children: [
                        Text(
                          doctorOccupation,
                          style: getSemiBoldStyle(
                              color: MyColors.labCardInnerColor,
                              fontSize: MyFonts.size14),
                        ),
                        Container(
                          height: 10.h,
                          width: 1.h,
                          color: MyColors.borderColor,
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                        ),
                        Text(
                          doctorSeniority,
                          style: getSemiBoldStyle(
                              color: MyColors.labCardInnerColor,
                              fontSize: MyFonts.size14),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          padding12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    labName,
                    style: getBoldStyle(
                        color: MyColors.textColor, fontSize: MyFonts.size16),
                  ),
                  padding3,
                  Text(
                    labLocation,
                    style: getMediumStyle(
                        color: MyColors.labCardInnerColor,
                        fontSize: MyFonts.size12),
                  ),
                ],
              ),
              CustomButton(
                onPressed: onCardTap,
                buttonText: 'Edit Offer',
                buttonWidth: 95.w,
                buttonHeight: 20.h,
                textStyle: getRegularStyle(
                    color: MyColors.whiteColor, fontSize: MyFonts.size10),
              )
            ],
          ),
          padding12,
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              children: List.generate(labCategories.length, (index) {
                return DLabCategoryChip(
                  chipText: labCategories[index],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
