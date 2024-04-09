import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class LabPaymentDetails extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const LabPaymentDetails(
      {super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: getSemiBoldStyle(
                color: MyColors.black, fontSize: MyFonts.size11)),
        padding12,
        PaymentDetailTextField(
          controller: controller,
        ),
      ],
    );
  }
}

class PaymentDetailTextField extends StatelessWidget {
  final TextEditingController controller;
  const PaymentDetailTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      width: 1.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: MyColors.paymenttfColor,
          boxShadow: [
            BoxShadow(
              color: MyColors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.w),
        ),
      ),
    );
  }
}
