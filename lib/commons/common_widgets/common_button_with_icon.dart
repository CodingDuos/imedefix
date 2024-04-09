import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:idaawee/utils/loading.dart';

class CommonButtonWithIcon extends StatelessWidget {
  const CommonButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
    this.backColor,
    this.textColor,
    this.buttonWidth,
    this.buttonHeight,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.textStyle,
    required this.icon,
  });
  final Function()? onPressed;
  final String buttonText;
  final bool isLoading;
  final Color? backColor;
  final Color? textColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;
  final double? padding;
  final double? borderRadius;
  final TextStyle? textStyle;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight ?? 54.h,
      margin: EdgeInsets.symmetric(vertical: padding ?? 10.h),
      child: RawMaterialButton(
        elevation: 2,
        fillColor:
            backColor ?? Theme.of(context).colorScheme.secondaryContainer,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 190.r),
        ),
        child: SizedBox(
          // padding: EdgeInsets.symmetric(vertical: 10.h),
          width: buttonWidth ?? double.infinity,
          height: buttonHeight ?? 56.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, height: 25.h, width: 26.h),
              SizedBox(width: 8.w),
              isLoading
                  ? LoadingWidget(
                      color: Theme.of(context).colorScheme.onPrimary)
                  : Text(
                      buttonText,
                      style: textStyle ??
                          getMediumStyle(
                              color: textColor ?? Colors.white,
                              fontSize: fontSize ?? MyFonts.size14),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
