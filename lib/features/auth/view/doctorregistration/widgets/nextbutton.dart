import 'package:get/get.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_register_provider.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class NextButton extends StatelessWidget {
  final controller = Get.put(DoctorIndRegisterProvider());
  NextButton(
      {super.key,
      this.onPressed,
      required this.isbackbuton,
      required this.back,
      required this.text});
  final VoidCallback? onPressed;
  final bool isbackbuton;
  final String text;
  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isbackbuton)
          InkWell(
            onTap: back,
            child: Container(
              width: 50,
              height: 45,
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                ),
              ),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        Expanded(
          child: CustomButton(
            onPressed: onPressed,
            buttonText: text,
            textStyle:
                getBoldStyle(color: MyColors.white, fontSize: MyFonts.size20),
          ),
        )
      ],
    );
  }
}
