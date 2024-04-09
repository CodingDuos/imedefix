import 'package:flutter/material.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UPinTextField extends StatelessWidget {
  final TextEditingController controller;
  const UPinTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54.h,
        width: 54.w,
        decoration: BoxDecoration(
          border: Border.all(
              color: MyColors.loginScreenTextColor.withOpacity(0.16)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: getRegularStyle(
              color: MyColors.loginScreenTextColor, fontSize: MyFonts.size18),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '0',
            hintStyle: getRegularStyle(
                color: MyColors.loginScreenTextColor.withOpacity(0.16),
                fontSize: MyFonts.size18),
          ),
        ));
  }
}
