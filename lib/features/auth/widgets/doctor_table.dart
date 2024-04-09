import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DoctorCalenderTextField extends StatelessWidget {
  final TextEditingController controller;
  final double borderRadius;
  final String hintText;
  final Color? hintColor;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;

  final IconData? icon;
  final String? Function(String?)? validatorFn;
  final Widget? leadingIcon;
  final Widget? tailingIcon;
  final String? leadingIconPath;
  final String? trailingIconPath;
  final double? texfieldHeight;
  final String label;
  final bool showLabel;
  // final IconData? iconData;
  final int? maxLines;
  final String subTitle;
  final Function()? subTitleOnTap;
  final Function()? onTap;
  final double? radius;

  DoctorCalenderTextField(
      {Key? key,
      // this.iconData,
      required this.controller,
      required this.hintText,
      required this.onChanged,
      required this.onFieldSubmitted,
      this.inputType,
      this.leadingIcon,
      this.validatorFn,
      this.hintColor,
      this.icon,
      this.tailingIcon,
      this.leadingIconPath,
      this.texfieldHeight,
      this.borderRadius = 100,
      required this.label,
      this.showLabel = true,
      this.trailingIconPath,
      this.maxLines,
      required this.subTitle,
      this.onTap,
      this.subTitleOnTap,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            label != ''
                ? Text(
                    label,
                    style: getSemiBoldStyle(
                        fontSize:
                            radius != null ? MyFonts.size18 : MyFonts.size14,
                        color: radius != null
                            ? MyColors.black
                            : MyColors.checkboxColor),
                  )
                : Container(),
            subTitle != ''
                ? InkWell(
                    onTap: subTitleOnTap,
                    child: Text(
                      subTitle,
                      style: getMediumStyle(
                          color: MyColors.appColor, fontSize: MyFonts.size12),
                    ),
                  )
                : Container()
          ],
        ),
        Container(
          height: 70,
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.9),
                offset: Offset.zero,
                blurRadius: 1,
              )
            ]),
            height: 60,
            child: TextFormField(
              onTap: onTap,
              maxLines: maxLines != null ? maxLines : 1,
              validator: validatorFn,
              controller: controller,
              keyboardType: inputType,
              style: getMediumStyle(
                  fontSize: MyFonts.size16, color: MyColors.black),
              decoration: InputDecoration(
                hintText: hintText,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                      color: MyColors.loginScreenTextColor
                          .withOpacity(0.16), // Border color
                      width: 1, // Border width
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                      color: Colors.red, // Border color
                      width: 1, // Border width
                    )),

                filled: true,
                fillColor: Colors.white, // Background color
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(
                    color: MyColors.loginScreenTextColor.withOpacity(0.16),
                    width: 1, // Border width
                  ),
                ),

                // suffixIcon: Icon(Icons.password),
                prefixIcon: GestureDetector(
                  onTap: () async {
                    // Show the date picker when the user taps the prefix icon
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    // Update the text field with the selected date
                    if (selectedDate != null) {
                      controller.text =
                          "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                    }
                  },
                  child: Icon(Icons.calendar_month),
                ),
                // ... other existing code ...
              ),
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
