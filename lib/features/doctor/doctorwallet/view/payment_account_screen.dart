// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_app_bar.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/routes/route_manager.dart';

import '../../../../commons/common_widgets/CustomTextFields.dart';
import '../../../../utils/constants/assets_manager.dart';

class AddPaymentScreen extends StatelessWidget {
  AddPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserHomeScreenProvider());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff38B698).withOpacity(0.1),
          automaticallyImplyLeading: true,
          title: Text(
            'Add Payments Method',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        // appBar: CommonAppBar(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   appBarTitle: 'Add Payments Method',
        // ),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                      MyColors.appColor1,
                      MyColors.appColor,
                    ])),
                    // color: const Color(0xff5EEF8F),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Allied Bank',
                                style: getBoldStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          padding15,
                          Text(
                            '4782 6782 6823 6782',
                            style:
                                getBoldStyle(color: Colors.white, fontSize: 20),
                          ),
                          padding15,
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Card Holder Name',
                                    style: getBoldStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Text(
                                    controller
                                        .userSpecificDoctorDetailsList[0].name
                                        .toString(),
                                    style: getBoldStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Expiry Date',
                                    style: getBoldStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Text(
                                    '03/26',
                                    style: getBoldStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  padding20,
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white,
                            ),
                            child: TextField(
                              controller: controller.cardType.value,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'Card Type...',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.3),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white,
                            ),
                            child: TextField(
                              controller: controller.cardName.value,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'Card Name...',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.3),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  padding20,
                  padding10,
                  CustomTextField(
                    controller: controller.accountNumber.value,
                    hintText: '',
                    onChanged: (string) {},
                    onFieldSubmitted: (string) {},
                    obscure: false,
                    label: 'Account/Iban Number',
                    subTitle: '',
                  ),
                  padding10,
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white,
                            ),
                            child: TextField(
                              controller: controller.expiryYear.value,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'expiry year',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.3),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white,
                            ),
                            child: TextField(
                              controller: controller.expiryMonth.value,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'expiry month',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.3),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: controller.cvvCode.value,
                          textAlign: TextAlign.center, // Center align the text
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'CVV',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  padding16,
                  NextButton(
                      back: () {},
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.walletSummaryPage);
                        controller.backDetails();
                      },
                      isbackbuton: false,
                      text: 'Next')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
