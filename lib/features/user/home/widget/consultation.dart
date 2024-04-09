import 'package:flutter/material.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_position_picture.dart';
import 'package:idaawee/features/doctor/doctor_profile/widgets/d_profile_tile.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/thems/my_colors.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  bool iseleted = false;
  bool iseleted2 = true;

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration;
    BoxDecoration boxDecoration2;

    if (iseleted2) {
      // If isSelected2 is true, use a gradient decoration
      boxDecoration = BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MyColors.appColor1,
            MyColors.appColor,
          ],
        ),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(30),
      );
    } else {
      // If isSelected2 is false, use a transparent decoration
      boxDecoration = BoxDecoration(
        color: Colors
            .transparent, // Use a solid color background (transparent in this case)
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(30),
      );
    }
    if (iseleted) {
      // If isSelected2 is true, use a gradient decoration
      boxDecoration2 = BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MyColors.appColor1,
            MyColors.appColor,
          ],
        ),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(30),
      );
    } else {
      // If isSelected2 is false, use a transparent decoration
      boxDecoration2 = BoxDecoration(
        color: Colors
            .transparent, // Use a solid color background (transparent in this case)
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(30),
      );
    }

    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    MyColors.appColor1,
                    MyColors.appColor,
                  ]),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Consultation',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 90.w, top: 50.h),
                            child: Image.asset(
                              AppAssets.loginBg,
                              height: 272.h,
                              width: 307.7.w,
                              color: MyColors.white.withOpacity(0.1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Image.asset(
                              AppAssets.bgGradient,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Positioned(
                                          child: Container(
                                            height: 650,
                                            width: 1.sw,
                                            decoration: const BoxDecoration(
                                              color: MyColors.lightBg,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight:
                                                      Radius.circular(30)),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    Text(
                                                      'Dr. Maria Elena',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                    Text(
                                                      'Psychologist',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Color(
                                                              0xff888888)),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'M.B.B.S., F.C.P.S (Psychology)',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Color(
                                                              0xff888888)),
                                                    ),
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Image.asset(
                                                          'assets/images/timer.png'),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      'The Consultation Session  \n '
                                                      'Has Ended',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      'Chat has been saved in Record',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Color(
                                                              0xff888888)),
                                                    ),
                                                    SizedBox(
                                                      height: 100.h,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5.0),
                                                      child: Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                iseleted =
                                                                    false;
                                                                iseleted2 =
                                                                    true;
                                                              });
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 150,
                                                              height: 55,
                                                              decoration:
                                                                  boxDecoration,
                                                              child: Text(
                                                                'Back to Home',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        17,
                                                                    color: iseleted2
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black
                                                                            .withOpacity(0.5)),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 60.w,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                iseleted2 =
                                                                    false;
                                                                iseleted = true;
                                                              });
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 150,
                                                              height: 55,
                                                              decoration:
                                                                  boxDecoration2,
                                                              child: Text(
                                                                'Add Review',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        17,
                                                                    color: iseleted
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black
                                                                            .withOpacity(0.5)),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        CommonpositionPicture(
                                          picturepath: AppAssets.doctorpro,
                                          onPressed: () {},
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ])));
  }
}
