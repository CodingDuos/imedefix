import 'package:idaawee/commons/common_functions/padding.dart';
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: MyColors.white,
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            Image.asset(
              'assets/images/img.png', // Path to your default image
              height: 92.h,
              width: 82.w,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name,
                          style: getBoldStyle(
                              color: MyColors.black, fontSize: MyFonts.size18)),
                      SizedBox(width: 6.w),
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
                    width: double.infinity,
                    color: MyColors.lightgrey,
                  ),
                  Text(
                    speciality,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: MyColors.ratingColor,
                        size: 13.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(rating.toString(),
                          style: getMediumStyle(
                              color: MyColors.black, fontSize: MyFonts.size12)),
                      SizedBox(width: 1.w),
                      Text(review,
                          style: getMediumStyle(
                              color: MyColors.grey, fontSize: MyFonts.size12)),
                    ],
                  ),
                  padding16
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
