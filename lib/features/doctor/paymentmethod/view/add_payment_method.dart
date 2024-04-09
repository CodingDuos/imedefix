import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_app_bar.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/routes/route_manager.dart';

import 'package:idaawee/utils/constants/font_manager.dart';

import '../../../../commons/common_widgets/CustomTextFields.dart';
import '../../../../utils/constants/assets_manager.dart';

class AddPaymentScreen extends StatelessWidget {
  const AddPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        appBarTitle: 'Add Payments Method',
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              CustomTextField(
                controller: TextEditingController(),
                hintText: '.... .... .... .... 5689',
                leadingIcon: Image.asset('assets/images/bank.png'),
                onChanged: (string) {},
                onFieldSubmitted: (string) {},
                obscure: false,
                label: '',
                subTitle: '',
              ),
              Expanded(child: Container()),
              NextButton(
                  back: () {},
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  isbackbuton: false,
                  text: 'Add More'),
              padding16,
              padding16,
            ],
          ),
        ),
      ),
    );
  }
}
