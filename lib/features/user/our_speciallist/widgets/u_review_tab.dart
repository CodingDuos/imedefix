// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/u_recomended_card.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/u_similar_doctor.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UReviewTabview extends StatefulWidget {
  const UReviewTabview({super.key});

  @override
  State<UReviewTabview> createState() => _UReviewTabviewState();
}

class _UReviewTabviewState extends State<UReviewTabview> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            padding10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest review',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            padding10,
            Container(
              height: 150.h,
              width: 500.w,
              //  width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 10,

                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: RecomondedCard(),
                  );
                },
              ),
            ),
            // isExpanded
            //     ? const SizedBox()
            //     : OutlinedButton(
            //         style: ButtonStyle(
            //           overlayColor: MaterialStateProperty.all(MyColors.white),
            //           shape: MaterialStateProperty.all(
            //             RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(5.r),
            //             ),
            //           ),
            //           side: MaterialStateProperty.all(
            //             BorderSide(width: 1.6.w, color: MyColors.appColor),
            //           ),
            //         ),
            //         onPressed: () {
            //           setState(() {
            //             isExpanded = true;
            //           });
            //         },
            //         child: Center(
            //             child: Padding(
            //           padding: EdgeInsets.symmetric(vertical: 18.h),
            //           child: Text(
            //             'Load More Reviews',
            //             style: getSemiBoldStyle(
            //                 color: MyColors.appColor, fontSize: MyFonts.size14),
            //           ),
            //         ))),
            SizedBox(
              height: 10.h,
            ),
            padding10,
            Container(
              width: 500.w,
              height: 180.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Need Help?',
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 16.w,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          'in case of any issue, contact o our care ',
                          style: getMediumStyle(
                              color: MyColors.grey, fontSize: MyFonts.size16),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: 450,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: MyColors.appColor, width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mail_outline,
                                color: MyColors.appColor,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  'imedefix SUPPORT'.toUpperCase(),
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.appColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ])),
            ),
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
