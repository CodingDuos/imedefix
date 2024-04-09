// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/apis_commons.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/doctor/home%20copy/widget/u_next_appointment_widget.dart';
import 'package:idaawee/features/doctor/home%20copy/widget/u_our_specialization_widget.dart';
import 'package:idaawee/features/doctor/home%20copy/widget/u_popular_doctor.dart';
import 'package:idaawee/features/doctor/home%20copy/widget/u_top_search_widget.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/user_all_speciallist.dart';

import 'package:idaawee/routes/route_manager.dart';

import 'package:idaawee/utils/constants/assets_manager.dart';

class UserHomeScreen extends ConsumerStatefulWidget {
  const UserHomeScreen({
    super.key,
  });

  @override
  ConsumerState<UserHomeScreen> createState() => _UserHomeScreen();
}

class _UserHomeScreen extends ConsumerState<UserHomeScreen> {
  // final controller = Get.put(UserHomeScreenProvider());

  // @override
  // void initState() {
  //   init();
  //   super.initState();
  // }

  // init() async {
  //   final id = await Global().getUserId();
  //   controller.SpecificUserDetails(id.toString());
  // }

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
              if (controller.SpeciicUserDetailsList.isEmpty) {
                return Text("No details available");
              } else {
                final details = controller.SpeciicUserDetailsList.first;
                return Text(
                  "Hi ${details.username} ",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
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
              radius: 21.h,
              backgroundColor: MyColors.white,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.notificationScreen);
                },
                icon: Stack(
                  children: [
                    Image.asset(
                      AppAssets.notification,
                      width: 20.w,
                      height: 20.h,
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: MyColors.appColor,
                          radius: 4.r,
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.homeBg), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    padding16,
                    const UTopSearchWidget(),
                    padding16,
                    UOurSpecializationWidget(),
                    padding16,
                    UNextAppointmentWidget(),
                    padding16,
                    const UpopularDoctor(),
                    padding24,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
