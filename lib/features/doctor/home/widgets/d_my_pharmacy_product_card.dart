import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_rectangular_cached_network_image.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DMyPharmacyProductCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productOrignalPrice;
  final String productDiscountPrice;
  final String productSaleTag;
  final double productRatting;
  final VoidCallback onEditProductTap;
  const DMyPharmacyProductCard(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productOrignalPrice,
      required this.productDiscountPrice,
      required this.productSaleTag,
      required this.productRatting,
      required this.onEditProductTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xffE5E9EB)),
      ),
      child: Column(
        children: [
          CachedRectangularNetworkImageWidget(
            image: productImage,
            width: 175,
            height: 85,
          ),
          Padding(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  productName,
                  style: getRegularStyle(color: MyColors.textColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$$productDiscountPrice',
                          style: getSemiBoldStyle(
                              color: MyColors.textColor,
                              fontSize: MyFonts.size12),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: productOrignalPrice.length * 9,
                                  height: 1.h,
                                  color: MyColors.searchTextColor,
                                )),
                            Text(
                              '\$$productOrignalPrice',
                              style: getSemiBoldStyle(
                                  color: MyColors.searchTextColor,
                                  fontSize: MyFonts.size12),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      productSaleTag,
                      style: getSemiBoldStyle(
                          color: MyColors.themeOrangeColor,
                          fontSize: MyFonts.size10),
                    )
                  ],
                ),
                padding4,
                Row(
                  children: [
                    Text(
                      '$productRatting',
                      style: getSemiBoldStyle(
                          color: MyColors.black, fontSize: MyFonts.size10),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    RatingBar.builder(
                      itemSize: 10.h,
                      initialRating: productRatting,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 10.h,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.w,
                ),
                Center(
                  child: CustomButton(
                    onPressed: onEditProductTap,
                    buttonText: 'Edit Product',
                    buttonWidth: 100.w,
                    buttonHeight: 31.h,
                    borderRadius: 6.r,
                    padding: 0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
