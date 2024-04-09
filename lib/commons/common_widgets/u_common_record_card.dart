// ignore_for_file: prefer_const_constructors

import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UCommonRecordCard extends StatelessWidget {
  final String image;
  final String name;
  final String speciality;
  final String qualification;
  final String status;
  final VoidCallback? onTap;
  final VoidCallback? patinumOnTap;
  const UCommonRecordCard(
      {super.key,
      required this.image,
      required this.name,
      required this.speciality,
      required this.qualification,
      required this.status,
      this.onTap,
      this.patinumOnTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 8.w, top: 12, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6.r),
                  child: Image.asset(
                    'assets/images/img.png',
                    height: 130.h,
                    width: 120.w,
                  )),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              overflow: TextOverflow.clip,
                              style: getBoldStyle(
                                  color: MyColors.black,
                                  fontSize: MyFonts.size16),
                            ),
                            padding10,
                            Image.asset(
                              AppAssets.star,
                              color: Colors.yellow,
                              height: 15.h,
                            ),
                            Text('5.4')
                          ],
                        ),
                      ),
                    ),
                    padding10,
                    Text(qualification),
                    Row(
                      children: [
                        Text('Status :',
                            style: getSemiBoldStyle(
                                color: MyColors.grey,
                                fontSize: MyFonts.size14)),
                        padding10,
                        Text('Inprogress ',
                            style: getSemiBoldStyle(
                                color: MyColors.green,
                                fontSize: MyFonts.size14))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
