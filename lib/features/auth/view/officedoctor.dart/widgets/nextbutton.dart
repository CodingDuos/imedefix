import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class NextButton extends StatelessWidget {
  const NextButton(
      {super.key,
      required this.onPressed,
      required this.isbackbuton,
      required this.text,
      required Null Function() back});
  final VoidCallback onPressed;
  final bool isbackbuton;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isbackbuton == false
            ? Container()
            : Expanded(
                flex: 1,
                child: Container(
                  height: 60,
                  width: 40.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black12)),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: MyColors.black,
                    ),
                  ),
                ),
              ),
        Expanded(
          flex: 3,
          child: CustomButton(
            onPressed: onPressed,
            buttonText: text,
            textStyle: getBoldStyle(
              color: MyColors.white,
              fontSize: MyFonts.size21,
            ),
          ),
        ),
      ],
    );
  }
}
