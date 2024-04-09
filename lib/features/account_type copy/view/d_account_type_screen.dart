import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/features/account_type%20copy/widget/d_account_type_card.dart';
import 'package:idaawee/features/auth/widgets/doctor_office_login_screen.dart';

import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:idaawee/utils/global.dart';

class DoctorAccountType extends StatefulWidget {
  const DoctorAccountType({super.key});

  @override
  State<DoctorAccountType> createState() => _DoctorAccountTypeState();
}

class _DoctorAccountTypeState extends State<DoctorAccountType> {
  // int index = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
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
                        bottom: 20.h,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select Type Of\nYour Account',
                                style: getBoldStyle(
                                    color: MyColors.white,
                                    fontSize: MyFonts.size26),
                              ),
                              padding10,
                              Text(
                                'Choose the type of your account,\nbe careful to change it is impossible',
                                style: getSemiBoldStyle(
                                    color: MyColors.white,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: 1.sw,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      padding20,
                      DoctorAccountTypeCard(
                        image: AppAssets.individualdoctor,
                        title: individual,
                        subTitle: individualDec,
                        onTap: () {
                          setState(() {
                            Global.index = 0;
                          });
                        },
                        selectIndex: Global.index,
                        index: 0,
                      ),
                      padding10,
                      DoctorAccountTypeCard(
                        image: AppAssets.officedoctor,
                        title: officetext,
                        subTitle: officeDec,
                        onTap: () {
                          setState(() {
                            Global.index = 1;
                          });
                        },
                        selectIndex: Global.index,
                        index: 1,
                      ),
                      padding10,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomButton(
                          onPressed: () {
                            if (Global.index == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DoctorOfficeLoginScreen(
                                              isofficedocor: true)));
                            } else {
                              Navigator.pushNamed(
                                  context, AppRoutes.doctorloginScreen);
                            }
                          },
                          buttonText: 'Continue',
                          textStyle: getBoldStyle(
                              color: MyColors.white, fontSize: MyFonts.size18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
