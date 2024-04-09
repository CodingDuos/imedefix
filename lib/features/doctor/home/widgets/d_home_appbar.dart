import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_circular_cached_network_image.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DHomeAppBar extends StatelessWidget {
  final String profileImageLink;
  final String doctorName;
  final VoidCallback onMenuTap;
  const DHomeAppBar({
    super.key,
    required this.profileImageLink,
    required this.doctorName,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142.h,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        color: MyColors.appColor,
      ),
      padding: EdgeInsets.only(left: 27.w, right: 27.w, top: 28.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: 52.h,
            ),
            child: Row(
              children: [
                CachedCircularNetworkImageWidget(
                  size: 50,
                  image: profileImageLink,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      style: getMediumStyle(
                          color: MyColors.whiteColor, fontSize: MyFonts.size12),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      doctorName,
                      style: getBoldStyle(
                          color: MyColors.whiteColor, fontSize: MyFonts.size18),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
