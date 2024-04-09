import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/doctorwslots_model.dart';

class TimingPageHiring extends StatefulWidget {
  const TimingPageHiring({Key? key, required this.timingslots})
      : super(key: key);
  final DoctorAvailability timingslots;

  @override
  State<TimingPageHiring> createState() => _TimingPageHiringState();
}

class _TimingPageHiringState extends State<TimingPageHiring> {
  final controller = Get.put(UserHomeScreenProvider());

  String selectedWeeklySlot = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          padding12,
          Row(
            children: [
              Image.asset(
                'assets/images/sun.png',
                height: 12.h,
                width: 12.w,
              ),
              padding10,
              const Text('Morning Slot')
            ],
          ),
          padding10,
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedWeeklySlot =
                          widget.timingslots.session1!.startTime.toString();

                      controller.setweektimeSlot(selectedWeeklySlot);
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient:
                          widget.timingslots.session1!.startTime.toString() !=
                                  selectedWeeklySlot
                              ? null
                              : const LinearGradient(
                                  colors: [
                                    MyColors.appColor1,
                                    MyColors.appColor,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                      border: Border.all(
                        color: MyColors.grey.withOpacity(0.50),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        widget.timingslots.session1!.startTime.toString(),
                        style: getBoldStyle(
                          color: widget.timingslots.session1!.startTime !=
                                  selectedWeeklySlot
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedWeeklySlot =
                          widget.timingslots.session1!.endTime.toString();
                      controller.setweektimeSlot(selectedWeeklySlot);

                      print("Week Time ===> ${controller.weekTime}");
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient:
                          widget.timingslots.session1!.endTime.toString() !=
                                  selectedWeeklySlot
                              ? null
                              : const LinearGradient(
                                  colors: [
                                    MyColors.appColor1,
                                    MyColors.appColor,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                      border: Border.all(
                        color: MyColors.grey.withOpacity(0.50),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        widget.timingslots.session1!.endTime.toString(),
                        style: getBoldStyle(
                          color: widget.timingslots.session1!.endTime !=
                                  selectedWeeklySlot
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          padding12,
          Row(
            children: [
              Image.asset(
                'assets/images/moon.png',
                height: 12.h,
                width: 12.w,
              ),
              padding10,
              const Text('Evening Slot')
            ],
          ),
          padding10,
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedWeeklySlot =
                          widget.timingslots.session2!.startTime.toString();
                      controller.setweektimeSlot(selectedWeeklySlot);
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient:
                          widget.timingslots.session2!.startTime.toString() !=
                                  selectedWeeklySlot
                              ? null
                              : const LinearGradient(
                                  colors: [
                                    MyColors.appColor1,
                                    MyColors.appColor,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                      border: Border.all(
                        color: MyColors.grey.withOpacity(0.50),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        widget.timingslots.session2!.startTime.toString(),
                        style: getBoldStyle(
                          color: widget.timingslots.session2!.startTime !=
                                  selectedWeeklySlot
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedWeeklySlot =
                          widget.timingslots.session2!.endTime.toString();
                      controller.setweektimeSlot(selectedWeeklySlot);
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient:
                          widget.timingslots.session2!.endTime.toString() !=
                                  selectedWeeklySlot
                              ? null
                              : const LinearGradient(
                                  colors: [
                                    MyColors.appColor1,
                                    MyColors.appColor,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                      border: Border.all(
                        color: MyColors.grey.withOpacity(0.50),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        widget.timingslots.session2!.endTime.toString(),
                        style: getBoldStyle(
                          color: widget.timingslots.session2!.endTime !=
                                  selectedWeeklySlot
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
