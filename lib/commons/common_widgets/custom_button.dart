import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:idaawee/utils/loading.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
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
    this.borderColor,
  });
  final Function()? onPressed;
  final String buttonText;
  final bool isLoading;
  final Color? backColor;
  final Color? textColor;
  final Color? borderColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;
  final double? padding;
  final double? borderRadius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight ?? 54.h,
      margin: EdgeInsets.symmetric(vertical: padding ?? 10.h),
      child: RawMaterialButton(
        onPressed: onPressed,
        elevation: 2,
        fillColor: backColor ?? MyColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 190.r),
        ),
        child: Container(
          decoration: BoxDecoration(
              border: borderColor != null
                  ? Border.all(color: borderColor ?? backColor!)
                  : null,
              borderRadius: BorderRadius.circular(borderRadius ?? 190.r),
              gradient: backColor == null
                  ? const LinearGradient(colors: [
                      MyColors.appColor1,
                      MyColors.appColor,
                    ])
                  : null),
          // padding: EdgeInsets.symmetric(vertical: 10.h),
          width: buttonWidth ?? double.infinity,
          height: buttonHeight ?? 56.h,
          child: Center(
              child: isLoading
                  ? LoadingWidget(
                      color: Theme.of(context).colorScheme.onPrimary)
                  : Text(
                      buttonText,
                      style: textStyle ??
                          getMediumStyle(
                              color: textColor ?? Colors.white,
                              fontSize: fontSize ?? MyFonts.size17),
                    )),
        ),
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
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
          child: Center(
              child: isLoading
                  ? LoadingWidget(
                      color: Theme.of(context).colorScheme.onPrimary)
                  : Text(
                      buttonText,
                      style: getBoldStyle(
                          color: textColor ?? Colors.white,
                          fontSize: fontSize ?? MyFonts.size14),
                    )),
        ),
      ),
    );
  }
}
