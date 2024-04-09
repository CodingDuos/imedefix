import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';


class UCustomAppBar extends StatelessWidget {
  final VoidCallback onSearchTap;
  final String profileImage;
  final String userName;
  final VoidCallback? onPress;
  final bool isBackButton;
  const UCustomAppBar(
      {super.key,
      required this.onSearchTap,
      required this.profileImage,
      required this.userName,
      this.onPress,
      required this.isBackButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165.h,
      width: 1.sw,
      child: Stack(
        children: [
          Container(
            height: 156.h,
            width: 1.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
              color: MyColors.appColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          isBackButton == true
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: InkWell(
                                    onTap:
                                        onPress ?? () => Navigator.pop(context),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20.h,
                                      color: MyColors.white,
                                    ),
                                  ),
                                )
                              : Container(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.asset(
                              profileImage,
                              height: 40.h,
                              width: 40.w,
                            ),
                          ),
                          padding10,
                          Text(
                            userName,
                            style: getMediumStyle(
                                color: MyColors.white,
                                fontSize: MyFonts.size14),
                          ),
                        ],
                      ),
                      // InkWell(
                      //   onTap: onMenuTap,
                      //   child: Icon(
                      //     Icons.menu,
                      //     color: MyColors.white,
                      //     size: 24.h,
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 18,
            right: 18,
            child: GestureDetector(
              onTap: onSearchTap,
              child: Container(
                  height: 50.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(6.r),
                      boxShadow: [
                        BoxShadow(
                          color: MyColors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(1, 3),
                        ),
                      ]),
                  child:  Container()),
            ),
          ),
        ],
      ),
    );
  }
}
