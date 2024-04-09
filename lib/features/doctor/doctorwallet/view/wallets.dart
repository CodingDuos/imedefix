import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/routes/route_manager.dart';

class DoctorwalletAmount extends StatefulWidget {
  const DoctorwalletAmount(
      {super.key, required this.onPressed, required this.tabController});
  final VoidCallback onPressed;
  final TabController tabController;

  @override
  State<DoctorwalletAmount> createState() => _DoctorwalletAmountState();
}

class _DoctorwalletAmountState extends State<DoctorwalletAmount> {
  final TextEditingController namecontroller = TextEditingController();
  String input = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      input += buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -110,
          left: 0,
          right: 0,
          child: Container(
            height: 150,
            color: Colors.white.withOpacity(0.30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Available Balance',
                        style: getBoldStyle(color: MyColors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$1612.458',
                        style:
                            getBoldStyle(color: MyColors.white, fontSize: 32),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: 1.sw,
          decoration: const BoxDecoration(
            color: MyColors.lightBg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter Withdraw Amount',
                        style:
                            getBoldStyle(color: MyColors.black, fontSize: 16.h),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$$input',
                        style: getBoldStyle(
                            color: MyColors.appColor1, fontSize: 40.h),
                      ),
                    ],
                  ),
                  Divider(
                    color: MyColors.grey.withOpacity(0.20),
                  ),
                  Row(
                    children: ['50', '100', '200']
                        .map((e) => Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    input = e;
                                  });
                                },
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: MyColors.grey.withOpacity(0.50),
                                      ),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text('\$ $e'),
                                  ),
                                ),
                              ),
                            )))
                        .toList(),
                  ),
                  padding10,
                  buildrow(['1', '2', '3']),
                  buildrow(['4', '5', '6']),
                  buildrow(['7', '8', '9']),
                  buildrow(['.', '0', 'CE']),
                  NextButton(
                      back: () {},
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.addPaymentMethod);
                      },
                      isbackbuton: false,
                      text: 'Continue')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildrow(List demolist) {
    return Row(
      children: demolist
          .map((e) => Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    if (e == 'CE') {
                      input = '';
                      print('ce');
                      setState(() {});
                    } else if (e == '.') {
                      _onButtonPressed('.');
                    } else {
                      var intparsed = int.parse(e);
                      _onButtonPressed(intparsed.toString());
                    }
                    // if (intparsed != null) {
                    //   _onButtonPressed(intparsed.toString());
                    //   print(input);
                    // }
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: MyColors.grey.withOpacity(0.10),
                      border: Border.all(
                        color: MyColors.grey.withOpacity(0.50),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$e',
                        style:
                            getBoldStyle(color: MyColors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )))
          .toList(),
    );
  }
}
