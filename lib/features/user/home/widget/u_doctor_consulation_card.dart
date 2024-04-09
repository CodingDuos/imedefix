import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/home%20copy/view/user_next_appointment_screen.dart';

import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/confrom_oppointment_model.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UDoctorNextAppointmentCard extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final String id;
  final String specialist;
  final VoidCallback onTap;
  final String time;
  ConformOppointmentModel? model;

  UDoctorNextAppointmentCard(
      {super.key,
      required this.image,
      required this.id,
      required this.name,
      required this.model,
      required this.specialist,
      required this.date,
      required this.onTap,
      required this.time});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          //  color: Colors.amber,
          height: 190.h,
          width: screensize.width.w,
          // width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    width: screensize.width.w,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5.r),
                      image: const DecorationImage(
                          image: AssetImage(AppAssets.bgGradient),
                          fit: BoxFit.cover),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            MyColors.appColor1,
                            MyColors.appColor,
                          ]),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth: 400.w, maxHeight: 48.h),
                                child: Text(name,
                                    style: getBoldStyle(
                                        color: MyColors.white,
                                        fontSize: MyFonts.size18)),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth: 402.w, maxHeight: 48.h),
                                child: Text(specialist,
                                    style: getSemiBoldStyle(
                                        color: MyColors.white,
                                        fontSize: MyFonts.size12)),
                              ),
                              padding20,
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserNextAppointmenyScreen(
                                                specialist: '',
                                                DoctorName: name,
                                                id: id,
                                                PatientNames: name,
                                                sletedDate: date,
                                                model: model!,
                                                seltedTime: time,
                                              )));
                                },
                                child: Container(
                                  height: 71.h,
                                  width: screensize.width / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: MyColors.white.withOpacity(0.3),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Row(
                                            children: [
                                              padding10,
                                              Image.asset(
                                                AppAssets.cal,
                                                height: 13.h,
                                                width: 13.h,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                date,
                                                style: getSemiBoldStyle(
                                                    color: MyColors.white,
                                                    fontSize: MyFonts.size12),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      padding4,
                                      FittedBox(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Row(
                                            children: [
                                              padding10,
                                              Image.asset(
                                                AppAssets.clock,
                                                height: 13.h,
                                                width: 13.h,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                time,
                                                style: getSemiBoldStyle(
                                                    color: MyColors.white,
                                                    fontSize: MyFonts.size12),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: -10,
                  child: Image.asset(
                    image,
                    height: 200.h,
                    width: 145.w,
                    fit: BoxFit.fill,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
