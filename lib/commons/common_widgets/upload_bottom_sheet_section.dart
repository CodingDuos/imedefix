import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UploadBottomSheetSection extends StatelessWidget {
  final Function() camera;
  final Function() gallery;
  final String title;
  const UploadBottomSheetSection(
      {super.key,
      required this.camera,
      required this.gallery,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75.0),
      child: Container(
        height: 250.h,
        decoration: const BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                      color: MyColors.greyBottom,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              padding40,
              Text(title,
                  style: getMediumStyle(
                      color: MyColors.black, fontSize: MyFonts.size22)),
              padding32,
              InkWell(
                onTap: camera,
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.camera,
                      width: 15.w,
                      height: 12.h,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      takeaphoto,
                      style: getRegularStyle(
                          color: MyColors.black, fontSize: MyFonts.size16),
                    ),
                  ],
                ),
              ),
              padding16,
              InkWell(
                onTap: gallery,
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.gallery,
                      width: 15.w,
                      height: 12.h,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      uploadfromgallery,
                      style: getRegularStyle(
                          color: MyColors.black, fontSize: MyFonts.size16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
