import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  const UProfileTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText,
          style: getBoldStyle(color: MyColors.profilegrey.withOpacity(0.75)),
        ),
        Container(
          height: 27.h,
          width: 177.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: MyColors.lightContainerColor,
          ),
          child: TextFormField(
            style: getMediumStyle(
                color: MyColors.profilegrey, fontSize: MyFonts.size11),
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                contentPadding: const EdgeInsets.only(bottom: 17, left: 10),
                hintStyle: getMediumStyle(
                    color: MyColors.profilegrey, fontSize: MyFonts.size11)),
          ),
        ),
      ],
    );
  }
}
