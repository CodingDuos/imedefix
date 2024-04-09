// ignore_for_file: prefer_const_constructors, must_be_immutable, deprecated_member_use

import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/features/auth/view/doctorregistration/basiinformation.dart';
import 'package:idaawee/features/auth/view/doctorregistration/consultation.dart';
import 'package:idaawee/features/auth/view/doctorregistration/doctorProfile.dart';
import 'package:idaawee/features/auth/view/doctorregistration/education.dart';
import 'package:idaawee/features/auth/view/officedoctor.dart/o_basiinformation.dart';
import 'package:idaawee/features/auth/view/officedoctor.dart/o_consultation.dart';
import 'package:idaawee/features/auth/view/officedoctor.dart/o_doctorProfile.dart';
import 'package:idaawee/features/auth/view/officedoctor.dart/o_education.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_register_provider.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import '../../../commons/common_imports/common_libs.dart';

class DoctorRegistration extends StatefulWidget {
  DoctorRegistration({super.key, required this.isofficedoctor});
  bool isofficedoctor = false;

  @override
  State<DoctorRegistration> createState() => _DoctorRegistrationState();
}

class _DoctorRegistrationState extends State<DoctorRegistration>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final contoller = Get.put(DoctorIndRegisterProvider());
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  int selectdpage = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.appColor1,
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text('Setup Your Profile',
              style: getBoldStyle(
                  color: MyColors.black, fontSize: MyFonts.size20)),
        ),
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
                        top: 10.h,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRect(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [0, 1, 2, 3].map((e) {
                                      double maxWidth =
                                          MediaQuery.of(context).size.width / 6;
                                      double maxWidth3 =
                                          MediaQuery.of(context).size.width /
                                              2.6;
                                      double maxWidth2 =
                                          MediaQuery.of(context).size.width / 8;

                                      return AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        width: e == selectdpage
                                            ? maxWidth3
                                            : e == 3
                                                ? maxWidth2
                                                : maxWidth,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 12,
                                              backgroundColor: MyColors.white,
                                              child: selectdpage != e
                                                  ? Container()
                                                  : const CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor:
                                                          MyColors.appColor1,
                                                    ),
                                            ),
                                            padding4,
                                            if (e == selectdpage)
                                              Expanded(
                                                child: Text(
                                                  widget.isofficedoctor == true
                                                      ? officedoctorregistrationTabsNames[
                                                          e]
                                                      : doctorregistrationTabsNames[
                                                          e],
                                                  style: getSemiBoldStyle(
                                                    color: MyColors.white,
                                                    fontSize: MyFonts.size12,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              )
                                            else
                                              e == 3
                                                  ? Container()
                                                  : Expanded(
                                                      child:
                                                          _buildDottedDivider()),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 7,
                  child: widget.isofficedoctor == true
                      ? office_doctor_registrationTabsPages[selectdpage]
                      : doctorregistrationTabsPages[selectdpage]),
            ],
          ),
        ),
      ),
    );
  }

  changescreen(int index) {
    setState(() {
      selectdpage = index;
    });
  }

  late List doctorregistrationTabsPages = [
    BasicInformation(
        onPressed: () => changescreen(1),
        onPressedback: () {
          Navigator.pop(context);
        }),
    EducationAndExeience(
        onPressed: () => changescreen(2), onPressedback: () => changescreen(0)),
    ConsultaionandTime(
      onPressed: () => changescreen(3),
      onPressedback: () => changescreen(1),
    ),
    DoctorProfile(onPressedback: () {
      changescreen(3);
    })
  ];

  // ignore: non_constant_identifier_names
  late List office_doctor_registrationTabsPages = [
    Office_BasicInformation(onPressed: () => changescreen(1)),
    Office_EducationAndExeience(onPressed: () => changescreen(2)),
    Office_ConsultaionandTime(onPressed: () => changescreen(3)),
    Office_DoctorProfile()
  ];
}

List doctorregistrationTabsNames = [
  'Basic Information',
  'Education & Experience',
  'Consultation fee & time',
  'Review Profile'
];

List officedoctorregistrationTabsNames = [
  'Basic Information',
  'Office Type & Location',
  'Add doctor in your office',
  'Review Profile'
];

Widget _buildDottedDivider() {
  return SizedBox(
    width: double.infinity,
    height: 1,
    child: CustomPaint(
      painter: DottedLinePainter(),
    ),
  );
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white // Change the color if needed
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    const double dashWidth = 4.0;
    const double dashSpace = 4.0;
    double currentX = 0.0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, 0.0),
        Offset(currentX + dashWidth, 0.0),
        paint,
      );

      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
