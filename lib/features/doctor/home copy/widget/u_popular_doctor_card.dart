import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UPopularDoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String speciality;
  final double rating;
  final String review;
  final Function()? onTap;
  const UPopularDoctorCard(
      {super.key,
      required this.image,
      required this.name,
      this.onTap,
      required this.speciality,
      required this.rating,
      required this.review});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: MyColors.transparentColor,
      splashColor: MyColors.transparentColor,
      onTap: onTap,
      child: Container(
        height: 116.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: MyColors.white,
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            Image.asset(
              image,
              height: 92.h,
              width: 92.w,
            ),
            SizedBox(width: 10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name,
                        style: getBoldStyle(
                            color: MyColors.black, fontSize: MyFonts.size18)),
                    SizedBox(width: 35.w),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: MyColors.appColor,
                        )),
                  ],
                ),
                Container(
                  height: 2.h,
                  width: 209.w,
                  color: MyColors.lightgrey,
                ),
                Text(speciality,
                    style: getSemiBoldStyle(
                        color: MyColors.grey, fontSize: MyFonts.size14)),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: MyColors.ratingColor,
                      size: 16.h,
                    ),
                    SizedBox(width: 5.w),
                    Text(rating.toString(),
                        style: getMediumStyle(
                            color: MyColors.black, fontSize: MyFonts.size14)),
                    SizedBox(width: 3.w),
                    Text(review,
                        style: getMediumStyle(
                            color: MyColors.grey, fontSize: MyFonts.size14)),
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
