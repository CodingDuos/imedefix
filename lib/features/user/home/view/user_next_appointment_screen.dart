import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/home/widget/u_doctor_detail_card.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

import '../widget/u_appointment_tab.dart';

class UserNextAppointmenyScreen extends StatelessWidget {
  final patientName;
  final sletedDate;
  final sletedTime;

  const UserNextAppointmenyScreen(
      {super.key,
      required this.patientName,
      required this.sletedDate,
      required this.sletedTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [MyColors.appColor1, MyColors.appColor],
              begin: Alignment.topLeft,
              end: Alignment.topRight),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Image.asset(
                AppAssets.loginBg,
                color: MyColors.white.withOpacity(0.1),
                width: 307.w,
                height: 274.h,
              ),
            ),
            Positioned(
              right: 40.w,
              child: Image.asset(
                AppAssets.bgGradient,
                width: 307.w,
                height: 274.h,
              ),
            ),
            Positioned(
              top: 50.h,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: MyColors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Appointments',
                        style: getBoldStyle(
                            color: MyColors.white, fontSize: MyFonts.size16),
                      ),
                      Container(
                        width: 20,
                      ),
                    ],
                  )),
            ),
            Positioned(top: 110.h, child: const UDoctorDeyailCard()),
            Positioned(
              top: 350.h,
              child: UAppointTab(),
            ),
          ],
        ),
      ),
    );
  }
}
