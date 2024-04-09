// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/features/user/home/patient_details_screen.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/timing2.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/u_similar_doctor.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_SpecificDetailsModel.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_individual_models/doctorwslots_model.dart';
import 'package:intl/intl.dart';
import '../../../../utils/constants/assets_manager.dart';

class BookDoctorPage extends StatefulWidget {
  final List<DoctorSpecificDatailsModel>? doctorSpecificDetail;

  BookDoctorPage({super.key, this.doctorSpecificDetail});

  @override
  State<BookDoctorPage> createState() => _BookDoctorPageState();
}

class _BookDoctorPageState extends State<BookDoctorPage> {
  final controller = Get.put(UserHomeScreenProvider());

  DoctorAvailability? timingSlotsData;

  bool isloadingData = false;
  triggling() {
    isloadingData = !isloadingData;
    setState(() {});
  }

  fetchdoctorslots() async {
    triggling();
    List<DoctorAvailability> slotsdata =
        await controller.fetchdoctortimingSlots(
            widget.doctorSpecificDetail!.first.sId.toString());
    timingSlotsData = slotsdata.first;
    triggling();
  }

  @override
  void initState() {
    fetchdoctorslots();
    // TODO: implement initState
    super.initState();
  }

  DateTime _selectedDate = DateTime.now();
  int _selectedDayIndex = 0; // To keep track of the selected day

  // Helper function to get the first date of the month
  DateTime _findFirstDateOfTheMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, 1);
  }

  List<DateTime> get _monthDays {
    final today = DateTime.now();
    final firstDayOfTheMonth = _findFirstDateOfTheMonth(_selectedDate);
    final daysInMonth =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;

    return List.generate(daysInMonth, (index) {
      final dayToAdd = firstDayOfTheMonth.add(Duration(days: index));
      // Only add the day if it's equal to or after today
      if (dayToAdd.isAfter(today) || _isSameDay(dayToAdd, today)) {
        return dayToAdd;
      } else {
        return null; // or any placeholder value to indicate skipping
      }
    }).whereType<DateTime>().toList(); // Filter out null values
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff38B698).withOpacity(0.1),
        automaticallyImplyLeading: true,
        title: Text(
          'Select Date & time',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      // appBar: CommonAppBar(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   appBarTitle: 'Select Date & time',
      // ),
      body: isloadingData
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: 1.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.homeBg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                color: Colors.white,
                child: ListView(
                  children: [
                    USimilarDoctor(
                      isaddingdoctor: true,
                      name: controller.userSpecificDoctorDetailsList[0].name
                          .toString(),
                      speciality: controller
                          .userSpecificDoctorDetailsList[0].specialization
                          .toString(),
                      image: 'assets/images/img.png',
                      rating: 4.5,
                      review: '452',
                      onPress: () {},
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _monthDays.isEmpty
                              ? Container()
                              : IconButton(
                                  icon: Icon(
                                    Icons.arrow_left,
                                    color: MyColors.appColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _selectedDate = DateTime(
                                          _selectedDate.year,
                                          _selectedDate.month - 1,
                                          _selectedDate.day);
                                      _selectedDayIndex = 0; // Reset selection
                                    });
                                  },
                                ),
                          Text(
                            DateFormat('MMMM yyyy').format(_selectedDate),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_right,
                              color: MyColors.appColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedDate = DateTime(_selectedDate.year,
                                    _selectedDate.month + 1, _selectedDate.day);
                                _selectedDayIndex = 0; // Reset selection
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _monthDays.isEmpty
                        ? Container()
                        : Container(
                            height: 110,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _monthDays.length,
                              itemBuilder: (context, index) {
                                final monthDay = _monthDays[index];
                                final isSelected = index == _selectedDayIndex;

                                // Custom date formatting
                                String formattedDate = DateFormat('dd')
                                    .format(monthDay); // Always use two digits

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDayIndex = index;

                                      _selectedDate = monthDay;
                                    });

                                    controller.setselectedday(
                                        _selectedDate.toString());
                                  },
                                  child: Container(
                                    width: 65,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      gradient: isSelected
                                          ? const LinearGradient(
                                              colors: [
                                                  MyColors.appColor1,
                                                  MyColors.appColor,
                                                ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight)
                                          : null,
                                      border: isSelected
                                          ? Border.all(
                                              color: Colors
                                                  .transparent) // No border for selected items
                                          : Border.all(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              width:
                                                  1.5), // Border for unselected items
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          formattedDate, // Date with leading zero if necessary
                                          style: TextStyle(
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.grey,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          DateFormat('EEE')
                                              .format(monthDay), // Day name
                                          style: TextStyle(
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.grey,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                    Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TimingPageHiring(
                            timingslots: timingSlotsData!,
                          ),
                        )),
                    padding20,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: NextButton(
                          back: () {},
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PatientDetailsScreen()));
                            // Navigator.pushNamed(context, AppRoutes.addPaymentScreen);
                          },
                          isbackbuton: false,
                          text: 'Next'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
