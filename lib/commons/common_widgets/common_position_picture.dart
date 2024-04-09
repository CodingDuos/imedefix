import 'package:flutter/widgets.dart';
import 'package:idaawee/utils/thems/my_colors.dart';

class CommonpositionPicture extends StatelessWidget {
  const CommonpositionPicture(
      {super.key, required this.onPressed, required this.picturepath});
  final VoidCallback onPressed;
  final String picturepath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -70,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  color: MyColors.grey.withOpacity(0.20),
                  child: Image.asset(
                    picturepath,
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
