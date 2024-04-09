import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class LabChoosePayment extends StatefulWidget {
  const LabChoosePayment({super.key});

  @override
  State<LabChoosePayment> createState() => _LabChoosePaymentState();
}

class _LabChoosePaymentState extends State<LabChoosePayment> {
  List<String> image = [
    AppAssets.visa,
    AppAssets.payoneer,
    AppAssets.paypal,
    AppAssets.mastercard,
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chooseaPaymentmethod,
          style:
              getRegularStyle(color: MyColors.black, fontSize: MyFonts.size14),
        ),
        padding20,
        SizedBox(
          height: 45.h,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 40.w),
              itemCount: image.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100.r),
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                        height: 45.h,
                        width: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                              color: selectedIndex == index
                                  ? MyColors.appColor
                                  : Colors.transparent,
                              width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            image[index],
                          ),
                        )),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
