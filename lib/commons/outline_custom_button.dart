import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:idaawee/utils/loading.dart';

class OutlineCustomButton extends StatelessWidget {
  const OutlineCustomButton({
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 190.r),
        border: Border.all(
          color: backColor ?? Theme.of(context).colorScheme.secondaryContainer,
          width: 1,
        ),
      ),
      child: RawMaterialButton(
        elevation: 2,
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
                      style: getMediumStyle(
                          color: textColor ?? Colors.white,
                          fontSize: fontSize ?? MyFonts.size16),
                    )),
        ),
      ),
    );
  }
}
