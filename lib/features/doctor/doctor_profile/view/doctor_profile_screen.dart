// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_position_picture.dart';
import 'package:idaawee/features/account_type/view/account_type_screen.dart';
import 'package:idaawee/features/doctor/doctor_profile/controller/main_menu_controller.dart';
import 'package:idaawee/features/doctor/doctor_profile/view/doctor_edit_profile_screen.dart';
import 'package:idaawee/features/doctor/doctor_profile/widgets/d_profile_tile.dart';
import 'package:idaawee/features/doctor/home%20copy/doctor_profile/Editdoctor_profile_screen2.dart';
import 'package:idaawee/providers/doctor_providers/doctor_individual_provider/doctor_ind_home_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import 'package:idaawee/utils/global.dart';
import '../../home copy/privacy_policy/information_centor_doctor.dart';

class DoctorProfileScreen extends ConsumerStatefulWidget {
  const DoctorProfileScreen({super.key, this.isuser = false});
  final bool isuser;

  @override
  ConsumerState<DoctorProfileScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends ConsumerState<DoctorProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    final mainMenuCtr = ref.watch(dProfileMainprovider);
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
                        top: 30.h,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    mainMenuCtr.isedit == true
                                        ? 'Edit Profile'
                                        : 'Profile',
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
                  flex: 6,
                  child: mainMenuCtr.isedit == false
                      ? buildDoctorProfileFields(
                          isuser: widget.isuser,
                          onPressed: () => mainMenuCtr.setIndex(true),
                        )
                      : DoctorEditProfileScreen(
                          onPressed: () => mainMenuCtr.setIndex(false),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}

class buildDoctorProfileFields extends StatefulWidget {
  buildDoctorProfileFields(
      {super.key, required this.onPressed, this.isuser = false});
  final VoidCallback onPressed;
  final bool isuser;

  @override
  State<buildDoctorProfileFields> createState() =>
      _buildDoctorProfileFieldsState();
}

class _buildDoctorProfileFieldsState extends State<buildDoctorProfileFields> {
  final controller = Get.put(DoctorIndHomeProvider());

  final TextEditingController namecontroller = TextEditingController();

  AccountTypeScreen accountTypeScreen = AccountTypeScreen();

  @override
  void initState() {
    init();

    super.initState();
  }

  init() async {
    final id = await Global().getUserId();
    controller.DoctorSpecificDoctorDetails(id.toString());

    print(' profile ======<<<<< ');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 1.sw,
          decoration: const BoxDecoration(
            color: MyColors.lightBg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  padding35,

                  Obx(() {
                    if (controller.SpecificDoctorDetailsList.isEmpty) {
                      return Text("No details available");
                    } else {
                      final details =
                          controller.SpecificDoctorDetailsList.first;
                      return Column(
                        children: [
                          Text("${details.name}"),
                          Text("${details.email}"),
                          Text("${details.sId}"),
                        ],
                      );
                    }
                  }),

                  DoctorProfileTile(
                    index: 0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditDoctorProfileScreen2()));
                    },
                    text: "My Profile",
                  ),
                  DoctorProfileTile(
                    index: 1,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.doctorwalletScreen);
                    },
                    text: "My Wallet",
                  ),
                  Global.index == 1
                      ? Container()
                      : DoctorProfileTile(
                          index: 2,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoutes.joinOfficePage);
                          },
                          text: "Join Office",
                        ),
                  DoctorProfileTile(
                    index: 3,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.addPaymentMethod);
                    },
                    text: "Payment Method",
                  ),
                  DoctorProfileTile(
                    index: 4,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.settingsPageScreen);
                    },
                    text: "Settings",
                  ),
                  // DoctorProfileTile(
                  //   index: 5,
                  //   onPressed: () {},
                  //   text: "Help Center",
                  // ),
                  DoctorProfileTile(
                    index: 5,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InformationCenter()));
                      ;
                    },
                    text: "Information Center",
                  ),
                  DoctorProfileTile(
                    index: 6,
                    onPressed: () async {
                      // controller.clearDoctorDetails();
                      await Global().removeUserId(context);
                    },
                    text: "Log Out",
                  ),
                  padding80
                ],
              ),
            ),
          ),
        ),
        CommonpositionPicture(
          onPressed: widget.onPressed,
          picturepath: widget.isuser == false
              ? 'assets/images/whiteman.png'
              : AppAssets.doctorpro,
        )
      ],
    );
  }
}
