// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, unused_import

import 'package:get/get.dart';

import 'package:idaawee/Services/apiServices/api_services.dart';
import 'package:idaawee/commons/common_functions/padding.dart';

import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_app_bar.dart';
import 'package:idaawee/features/doctor/doctor_main_menu/controller/main_menu_controller.dart';
import 'package:idaawee/features/doctor/home%20copy/widget/u_next_appointment_widget.dart';
import 'package:idaawee/features/user/home/widget/doctor_next_appointment.dart';
import 'package:idaawee/features/user/home/widget/u_popular_doctor_card.dart';
import 'package:idaawee/features/user/home/widget/u_top_search_widget.dart';
import 'package:idaawee/features/user/home/widget/u_next_appointment_widget.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/u_review_tab.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/user_all_speciallist.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_home_provider.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_login_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_SpecificDetailsModel.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:idaawee/utils/global.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../utils/constants/assets_manager.dart';

class DoctorHomeScreens extends StatefulWidget {
  DoctorHomeScreens({Key? key}) : super(key: key);

  @override
  _DoctorHomeScreensState createState() => _DoctorHomeScreensState();
}

class _DoctorHomeScreensState extends State<DoctorHomeScreens> {
  // @override
  // void initState() {
  //   init();

  //   super.initState();
  // }

  // init() async {
  //   final id = await Global().getUserId();

  //   doctorController.DoctorSpecificDoctorDetails(id.toString());
  // }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  void _onRefresh() async {
    // Perform your data fetching operations here.
    await Future.delayed(Duration(milliseconds: 1000));
    Get.put(DoctorIndHomeProvider());

    setState(() {
      Get.put(DoctorIndHomeProvider());
    });
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff38B698).withOpacity(0.1),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Obx(() {
              if (doctorcontroller.SpecificDoctorDetailsList.isEmpty) {
                return Text(
                  "No details available",
                  style: TextStyle(),
                );
              } else {
                final details =
                    doctorcontroller.SpecificDoctorDetailsList.first!;
                return Column(
                  children: [
                    Text(
                      "Hi  ${details.name}  ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                );
              }
            }),
            Image.asset(
              AppAssets.hand,
              height: 16.h,
              width: 16.h,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              backgroundColor: Colors
                  .white, // Replace with MyColors.white if it's defined in your code.
              child: IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, AppRoutes.notificationScreen); // Adjust according to your navigation setup.
                },
                icon: Stack(
                  children: [
                    Image.asset(
                      'assets/images/notification.png', // Replace with your asset path
                      width: 20,
                      height: 20,
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors
                              .red, // Replace with MyColors.appColor if it's defined in your code.
                          radius: 4,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(),
        onRefresh: _onRefresh,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  padding16,
                  const UTopSearchWidget(),
                  padding16,
                  DNextAppointmentWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        UPopularDoctorCard(
                          onTap: () {},
                          image: 'assets/images/Vector.png',
                          name: 'Shared Documents',
                          speciality: 'Upload on 10 May',
                          rating: 0,
                          review: '2 Documents',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500.h,
                    child: UReviewTabview(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
