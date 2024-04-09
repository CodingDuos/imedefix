import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UCommonPrivacyPolicyCard extends StatelessWidget {
  final String text;
  final String des;
  final String image;
  final bool requiredBorder;
  const UCommonPrivacyPolicyCard(
      {super.key,
      required this.text,
      required this.image,
      required this.des,
      required this.requiredBorder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        requiredBorder == false
            ? Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Image.asset(
                      image,
                      height: 22.h,
                      width: 22.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(text,
                        style: getMediumStyle(
                            color: MyColors.black94, fontSize: MyFonts.size16)),
                  ],
                ),
              )
            : Container(),
        SizedBox(
          height: 15.h,
        ),
        Container(
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: requiredBorder == true
                ? Border.all(color: MyColors.lightContainerColor)
                : null,
          ),
          child: Padding(
            padding: EdgeInsets.all(requiredBorder == true ? 12.0 : 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                requiredBorder == true
                    ? Row(
                        children: [
                          Image.asset(
                            image,
                            height: 22.h,
                            width: 22.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                            width: 0.7.sw,
                            child: Text(text,
                                style: getMediumStyle(
                                    color: MyColors.black94,
                                    fontSize: MyFonts.size18)),
                          ),
                        ],
                      )
                    : Container(),
                requiredBorder == true
                    ? SizedBox(
                        height: 10.h,
                      )
                    : Container(),
                Text(des,
                    textAlign: TextAlign.start,
                    style: requiredBorder == false
                        ? getRegularStyle(
                            color: MyColors.blueaccent,
                            fontSize: MyFonts.size12)
                        : getMediumStyle(
                            color: MyColors.searchTextColor,
                            fontSize: MyFonts.size14)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
