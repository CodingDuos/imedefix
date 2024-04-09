import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/product_card.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UCommonDoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String bannertitle;
  final Function() favorite;
  final Function() book;
  final bool payment;
  final bool isbanner;
  final Function()? seeAllDoctors;
  final Function()? chat;
  final Function()? call;
  final Function()? videocall;
  final double rating;
  final String description;
  final bool isFavorite;
  final Color? color;

  const UCommonDoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.favorite,
    required this.book,
    required this.seeAllDoctors,
    required this.rating,
    required this.description,
    required this.isFavorite,
    required this.bannertitle,
    required this.payment,
    this.chat,
    this.call,
    this.videocall,
    this.color,
    required this.isbanner,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TriangleCard(
          color: color,
          isBanner: isbanner,
          subCondition: bannertitle,
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                height: 141.89.h,
                width: 123.11.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 162.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name,
                            style: getMediumStyle(
                                color: MyColors.black,
                                fontSize: MyFonts.size18)),
                        InkWell(
                          onTap: favorite,
                          child: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color:
                                isFavorite ? MyColors.appColor : MyColors.black,
                            size: 17.h,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  payment == true
                      ? Row(
                          children: [
                            InkWell(
                                onTap: chat,
                                child: Image.asset(
                                  AppAssets.chat,
                                  height: 30.h,
                                  width: 30.w,
                                )),
                            SizedBox(
                              width: 30.w,
                            ),
                            InkWell(
                                onTap: call,
                                child: Image.asset(
                                  AppAssets.call,
                                  height: 30.h,
                                  width: 30.w,
                                )),
                            SizedBox(
                              width: 30.w,
                            ),
                            InkWell(
                                onTap: videocall,
                                child: Image.asset(
                                  AppAssets.videocall,
                                  height: 30.h,
                                  width: 30.w,
                                )),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: payment == true ? 4.h : 0,
                  ),
                  SizedBox(
                    width: 162.w,
                    child: Text(description,
                        style: getRegularStyle(
                            color: const Color(0xff858585),
                            fontSize: MyFonts.size12)),
                  ),
                  SizedBox(
                    height: payment == false ? 7.h : 0,
                  ),
                  SizedBox(
                    width: 162.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        payment == false
                            ? InkWell(
                                onTap: book,
                                child: Container(
                                    height: 26.29.h,
                                    width: 70.28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: MyColors.blueaccent,
                                    ),
                                    child: Center(
                                      child: Text('Book',
                                          style: getRegularStyle(
                                              color: MyColors.white,
                                              fontSize: MyFonts.size14)),
                                    )),
                              )
                            : Container(),
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
