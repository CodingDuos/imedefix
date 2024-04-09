import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class ChatAndFeedBkCard extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback? onTap;
  const ChatAndFeedBkCard(
      {super.key, required this.text, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: Image.asset(
                image,
                height: 57.h,
                width: 62.w,
              )),
          const SizedBox(width: 10),
          Container(
            constraints: BoxConstraints(maxWidth: 220.w, maxHeight: 48.h),
            child: Text(text,
                style: getSemiBoldStyle(
                    color: MyColors.grey, fontSize: MyFonts.size14)),
          ),
        ],
      ),
    );
  }
}
