import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class CompleteDoctorProfile extends StatelessWidget {
  CompleteDoctorProfile({
    super.key,
  });

  final TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        top: 40.h,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Your profile On Imedifix',
                                    style: getBoldStyle(
                                        color: MyColors.white,
                                        fontSize: MyFonts.size26),
                                  ),
                                ],
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
                  flex: 5,
                  child: Container(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 1.sw,
                          decoration: const BoxDecoration(
                            color: MyColors.lightBg,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Container(
                              color: MyColors.white.withOpacity(0.9),
                              child: Column(
                                children: [
                                  padding80,
                                  DefaultTabController(
                                    length: 2,
                                    child: SizedBox(
                                      height: 350.h,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 700.h,
                                              width: 1.sw,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25.r),
                                                color: MyColors.white
                                                    .withOpacity(0.9),
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Dr. Maria Elena',
                                                    style: getBoldStyle(
                                                        color: MyColors.black,
                                                        fontSize:
                                                            MyFonts.size20),
                                                  ),
                                                  padding6,
                                                  Text(
                                                    'Psychologist, M.B.B.S., F.C.P.S \n(Psychology)',
                                                    textAlign: TextAlign.center,
                                                    style: getSemiBoldStyle(
                                                        color: MyColors.grey,
                                                        fontSize:
                                                            MyFonts.size14),
                                                  ),
                                                  padding80,
                                                  Image.asset(
                                                      'assets/images/animation.gif'),
                                                  padding10,
                                                  const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                          'Status: Under Review'),
                                                    ],
                                                  ),
                                                  padding80,
                                                  Text(
                                                    'We will review your profile to activate your account and publish your profile online. Meanwhile, Feel Free to Reach out to us at www.imedifix.com',
                                                    textAlign: TextAlign.center,
                                                    style: getSemiBoldStyle(
                                                        color: MyColors.grey,
                                                        fontSize:
                                                            MyFonts.size14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  NextButton(
                                    back: () {},
                                    text: 'Next',
                                    isbackbuton: true,
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          AppRoutes.udoctormainMainMenuScreen);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -60,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 137.h,
                                width: 140,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image:
                                          AssetImage('assets/images/img.png'),
                                      fit: BoxFit.fill),
                                  border: Border.all(
                                      color: MyColors.white, width: 1.5),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
