// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/user_main_menu/views/main_menu_screen.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';

import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:flutter/material.dart';

// Assume AppColors and AppAssets are defined somewhere in your project.

import '../../doctor/doctorwallet/view/payment_account_screen.dart';

class PaymentAccountType extends StatefulWidget {
  const PaymentAccountType({Key? key}) : super(key: key);

  @override
  State<PaymentAccountType> createState() => _PaymentAccountTypeState();
}

class _PaymentAccountTypeState extends State<PaymentAccountType> {
  // Track selection state for each payment option
  bool isSelectedCard = false; // Set the default selection to Bank Card
  bool isSelectedPaypal = false;
  bool isSelectedApple = false;

  final controller = Get.put(UserHomeScreenProvider());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff38B698).withOpacity(0.1),
        title: Text(
          'Payment Account Type',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 19,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.add,
              size: 25,
              color: AppColors.defaultDateColor,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.030),
              Text('Credit & Debit Card',
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                    fontSize: 18,
                    color: AppColors.defaultDateColor,
                    fontWeight: FontWeight.w600,
                  ))),
              SizedBox(
                height: 10,
              ),
              _buildPaymentOption(
                screenWidth,
                '... ... ... ... ... 5738',
                'assets/icons/icons/bank_card.png',
                isSelectedCard,
                () {
                  if (!isSelectedCard) {
                    setState(() {
                      isSelectedCard = true;
                      isSelectedPaypal = false;
                      isSelectedApple = false;
                    });
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddPaymentScreen()))
                        .then((value) {
                      isSelectedCard = false;
                      isSelectedApple = false;
                      isSelectedPaypal = false;
                      setState(() {});
                    });
                  }
                },
              ),
              SizedBox(height: 40),
              Text('More Payment Options',
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                    fontSize: 18,
                    color: AppColors.defaultDateColor,
                    fontWeight: FontWeight.w600,
                  ))),
              SizedBox(
                height: 10,
              ),
              _buildPaymentOption(
                screenWidth,
                'Paypal',
                'assets/icons/icons/paypal.png',
                isSelectedPaypal,
                () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PaypalCheckout(
                      returnURL: "success.snippetcoder.com",
                      cancelURL: "cancel.snippetcoder.com",
                      sandboxMode: true,
                      clientId:
                          "AXFXfhTpTp775JjaH5UJwVPijLmayOeYeNuO-i8OHdtlzhQzavePzvvp0IVi0HnfrH6Egi_gn6buv9QV",
                      secretKey:
                          "ECUBk3NbfWOTfxF31w8gcv4FkDzA84NOiEc1FtPWjJm6Vdwe4WHnP06XJt7OjFzbN-B-1E7gQHWxtuXY",
                      transactions: const [
                        {
                          "amount": {
                            "total": '70',
                            "currency": "USD",
                            "details": {
                              "subtotal": '70',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description": "The payment transaction description.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                            "items": [
                              {
                                "name": "Apple",
                                "quantity": 4,
                                "price": '5',
                                "currency": "USD"
                              },
                              {
                                "name": "Pineapple",
                                "quantity": 5,
                                "price": '10',
                                "currency": "USD"
                              }
                            ],

                            // shipping address is not required though
                            //   "shipping_address": {
                            //     "recipient_name": "Raman Singh",
                            //     "line1": "Delhi",
                            //     "line2": "",
                            //     "city": "Delhi",
                            //     "country_code": "IN",
                            //     "postal_code": "11001",
                            //     "phone": "+00000000",
                            //     "state": "Texas"
                            //  },
                          }
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        controller.BookAppointmentMethod(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserMainMenuScreen(),
                          ),
                        );
                      },
                      onError: (error) {
                        print("onError: $error");
                        Navigator.of(context).pop();
                      },
                      onCancel: () {
                        print('cancelled:');
                      },
                    ),
                  ));
                  // Toggle the selection for Paypal
                  // setState(() {
                  //   isSelectedCard = false;
                  //   isSelectedPaypal = true;
                  //   isSelectedApple = false;
                  // });
                },
              ),
              SizedBox(height: 20),
              _buildPaymentOption(
                screenWidth,
                'Apple',
                'assets/icons/icons/apple.png',
                isSelectedApple,
                () {
                  // Toggle the selection for Apple
                  setState(() {
                    isSelectedCard = false;
                    isSelectedPaypal = false;
                    isSelectedApple = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(double screenWidth, String label, String iconPath,
      bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          children: [
            SizedBox(width: 20),
            Image.asset(
              iconPath,
            ),
            SizedBox(width: 15),
            Text(
              label,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.withOpacity(0.8),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 15),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Center(
                child: isSelected
                    ? Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff5EEF8F),
                              Color(0xff00A69D),
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                      )
                    : SizedBox(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
