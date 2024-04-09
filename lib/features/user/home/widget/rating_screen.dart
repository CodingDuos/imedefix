import 'package:flutter/material.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_position_picture.dart';
import 'package:idaawee/features/doctor/doctor_profile/widgets/d_profile_tile.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/thems/my_colors.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  bool iseleted = false;
  bool iseleted2 = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    BoxDecoration boxDecoration;
    BoxDecoration boxDecoration2;

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(
                          width: 80.h,
                        ),
                        Center(
                          child: Text(
                            'Rating Your Meeting',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
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
                              color: Color(0xffF6FBFA),
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
                                                      'How was your experience with\n '
                                                      'Dr. Maria Elena',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                    ),
                                                    SizedBox(
                                                      height: 40,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/Star5.png'),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Image.asset(
                                                            'assets/images/Star5.png'),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Image.asset(
                                                            'assets/images/Star5.png'),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Image.asset(
                                                            'assets/images/Star5.png'),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Image.asset(
                                                            'assets/images/Star5.png')
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 30.h,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        'Leave Comment',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      width: screenWidth,
                                                      height:
                                                          screenHeight * 0.22,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffE7E7E7)),
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    12.0,
                                                                vertical: 5),
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none, // Remove underline
                                                            hintText:
                                                                'Write here...', // Placeholder text
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .grey), // Placeholder text color
                                                          ),
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black), // Text color and size
                                                          maxLines:
                                                              null, // Allow multiple lines of text
                                                          cursorColor: Colors
                                                              .black, // Cursor color
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 100.h,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            iseleted = false;
                                                            iseleted2 = true;
                                                          });
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.w,
                                                          height: 55,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      MyColors
                                                                          .appColor1,
                                                                      MyColors
                                                                          .appColor,
                                                                    ],
                                                                    begin: Alignment
                                                                        .topLeft,
                                                                    end: Alignment
                                                                        .bottomRight,
                                                                  )),
                                                          child: Text(
                                                            ' Submit',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 17,
                                                                color: iseleted2
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5)),
                                                          ),
                                                        ),
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
