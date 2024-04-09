// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/thems/my_colors.dart';

class InformationCenter extends StatefulWidget {
  InformationCenter({super.key});

  @override
  State<InformationCenter> createState() => _InformationCenterState();
}

class _InformationCenterState extends State<InformationCenter> {
  bool isPrivacyChecked = false;

  bool isPolicyChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xff38B698).withOpacity(0.2),
        centerTitle: true,
        title: Text(
          'Privacy and  Policy',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
          // margin: EdgeInsets.symmetric(
          //   horizontal: 5,
          //)//,
          width: screenWidth,
          height: screenHight,
          decoration: BoxDecoration(
            color: const Color(0xff38B698).withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Term Of Servies',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w800))),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Last updated 24 Febuary 2024',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black87.withOpacity(0.5),
                                fontWeight: FontWeight.w500))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Summary',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w800))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: RichText(
                      text: TextSpan(
                        text:
                            'A Privacy Policy is a statement or a legal document that states how a company or website collects, handles and processes data of its customers and visitors.  ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: RichText(
                      text: TextSpan(
                        text:
                            'Companies or websites that handle customer information are required by law and third parties to publish their Privacy Policies on their business websites. If you own a website, ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Terms',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w800))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: RichText(
                      text: TextSpan(
                        text:
                            'A Privacy Policy is a statement or a legal document that states how a company or website collects, handles and processes data of its customers and visitors.  ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: RichText(
                      text: TextSpan(
                        text:
                            'A Privacy Policy is a statement or a legal document that states how a company or website collects, handles and processes data of its customers and visitors.  ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'A Privacy Policy is Required by the Law',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w800))),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          'A Privacy Policy is a statement or a legal document that states how a company or website collects, handles and processes data of its customers and visitors.A Privacy Policy is a statement or a legal document that states how a company or website collects, handles and processes data of its customers and visitors. ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        activeColor: Colors.green,
                        checkColor: Colors.black,
                        value: isPolicyChecked,
                        onChanged: (value) {
                          setState(() {
                            isPolicyChecked = value!;
                          });
                        },
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'I agree to the Terms and Conditions',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: screenWidth * 0.4,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              MyColors.appColor1,
                              MyColors.appColor,
                            ]),
                      ),
                      child: Text(
                        'Accept',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
