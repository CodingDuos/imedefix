import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DEditProfileDetailsSection extends StatelessWidget {
  const DEditProfileDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      AppAssets.profile,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 27.h,
                  width: 172.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: MyColors.paymenttfColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amelia Adam',
                          style: getMediumStyle(
                              color: MyColors.black.withOpacity(0.5),
                              fontSize: MyFonts.size12),
                        ),
                        Image.asset(
                          AppAssets.ok,
                          height: 9.h,
                          width: 9.h,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '+972 (59) 498 4242',
                  style: getMediumStyle(
                      color: MyColors.black.withOpacity(0.5),
                      fontSize: MyFonts.size12),
                )
              ],
            )
          ],
        ),
        Divider(
          thickness: 1.0.h,
        ),
      ],
    );
  }
}
