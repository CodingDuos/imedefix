import 'package:idaawee/commons/common_imports/common_libs.dart';
import '../../../../utils/constants/assets_manager.dart';
import '../../../../utils/constants/font_manager.dart';

class UUploadCard extends StatelessWidget {
  final VoidCallback onTap;
  String? title;
  UUploadCard({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 101.h,
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: MyColors.lightgrey),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.pdf,
                height: 21.h,
                width: 19.w,
              ),
              SizedBox(width: 10.w),
              Container(
                width: 150,
                child: Text(
                  title?.toString() ?? '',
                  style: getMediumStyle(
                      color: MyColors.grey, fontSize: MyFonts.size16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
