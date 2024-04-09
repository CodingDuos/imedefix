import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class USimilarDoctor extends StatelessWidget {
  final bool isaddingdoctor;
  final String name;
  final String speciality;
  final double rating;
  final String review;
  final String image;
  final VoidCallback onPress;
  const USimilarDoctor(
      {super.key,
      required this.name,
      this.isaddingdoctor = false,
      required this.speciality,
      required this.rating,
      required this.review,
      required this.image,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isaddingdoctor == true
            ? Container()
            : Text(
                'Similar Doctor',
                style: getBoldStyle(
                    color: MyColors.black, fontSize: MyFonts.size16),
              ),
        padding10,
        Container(
          height: 117.h,
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(6.r),
                    child: Image.asset('assets/images/img.png')),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    padding4,
                    Text(
                      name,
                      style: getBoldStyle(
                          color: MyColors.black, fontSize: MyFonts.size18),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 7.w),
                      width: 190.w,
                      height: 2.h,
                      color: MyColors.lightgrey,
                    ),
                    Text(
                      speciality,
                      style: getSemiBoldStyle(
                          color: MyColors.grey, fontSize: MyFonts.size14),
                    ),
                    padding4,
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: MyColors.appColor,
                          size: 16,
                        ),
                        Text(
                          rating.toString(),
                          style: getSemiBoldStyle(
                              color: MyColors.grey, fontSize: MyFonts.size14),
                        ),
                        padding4,
                        Text(
                          '($review reviews)',
                          style: getSemiBoldStyle(
                              color: MyColors.grey, fontSize: MyFonts.size14),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        padding20,
      ],
    );
  }
}
