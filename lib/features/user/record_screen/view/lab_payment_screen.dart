import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/apis_commons.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/common_app_bar.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/features/user/record_screen/widget/lab_payment_details.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../widget/lab_choose_payment.dart';
import '../widget/lab_confirmed_dialoge.dart';

// ignore: must_be_immutable
class LabPaymentScreen extends ConsumerWidget {
  LabPaymentScreen({super.key});

  var cardHolderNameController = TextEditingController();
  var cardNumberController = TextEditingController();
  var expiryDateController = TextEditingController();
  var cvvController = TextEditingController();
  var amountController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        appBarTitle: payment,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabChoosePayment(),
              padding20,
              Text(details,
                  style: getBoldStyle(
                      color: MyColors.black, fontSize: MyFonts.size16)),
              padding20,
              LabPaymentDetails(
                label: cardholdername,
                controller: cardHolderNameController,
              ),
              padding16,
              LabPaymentDetails(
                label: cardnumber,
                controller: cardNumberController,
              ),
              padding16,
              Row(
                children: [
                  Expanded(
                    child: LabPaymentDetails(
                      label: expirydate,
                      controller: expiryDateController,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: LabPaymentDetails(
                      label: cvv,
                      controller: cvvController,
                    ),
                  ),
                ],
              ),
              padding16,
              LabPaymentDetails(
                label: enteramount,
                controller: amountController,
              ),
              padding64,
              CustomButton1(
                onPressed: () {
                  _showDialoge(
                    context: context,
                    onConfirm: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.userMainMenuScreen,
                      );
                    },
                  );
                },
                buttonText: paynow,
                backColor: MyColors.appColor,
                borderRadius: 6.r,
                fontSize: MyFonts.size22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showDialoge({required BuildContext context, required Function() onConfirm}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            1,
          ),
          child: LabDialogConfirmation(
            onConfirm: onConfirm,
          ),
        );
      },
    );
  }
}
