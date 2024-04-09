// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/features/auth/widgets/doctor_ind_register_tab.dart';
import 'package:idaawee/features/auth/widgets/doctor_custom_widget/doctor_ind_login_tab.dart';
import 'package:idaawee/features/auth/widgets/doctor_custom_widget/doctor_office_login_tab.dart';
import 'package:idaawee/features/auth/widgets/doctor_custom_widget/doctor_office_register_tab.dart';

import 'package:idaawee/features/auth/widgets/tab_login.dart';
import 'package:idaawee/providers/doctor_providers/doctor_office_provider/doctor_office_login_provider.dart';

import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';
import '../../../commons/common_imports/common_libs.dart';

class DoctorOfficeLoginScreen extends StatefulWidget {
  DoctorOfficeLoginScreen({super.key, required this.isofficedocor});
  bool isofficedocor;

  @override
  State<DoctorOfficeLoginScreen> createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<DoctorOfficeLoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
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
                                  'Go Ahead & Set Up\nYour Account',
                                  style: getBoldStyle(
                                      color: MyColors.white,
                                      fontSize: MyFonts.size26),
                                ),
                                padding10,
                                Text(
                                  'Sign In-Up To Enjoy The Best Doctor\nConsultation Experience',
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
                      color: MyColors.lightBg,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: MyColors.lightgrey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: TabBar(
                              indicatorPadding: EdgeInsets.zero,
                              dividerColor: Colors.transparent,
                              indicatorColor: Colors.transparent,
                              controller: tabController,
                              // give the indicator a decoration (color and border radius)
                              indicator: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  MyColors.appColor1,
                                  MyColors.appColor,
                                ]),
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                                color: Colors.green,
                              ),
                              labelColor: MyColors.white,
                              unselectedLabelColor: MyColors.grey,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              tabs: [
                                Tab(
                                  child: SizedBox(
                                    width: 170.w,
                                    child: const Center(child: Text('Login')),
                                  ),
                                ),
                                Tab(
                                  child: SizedBox(
                                    width: 170.w,
                                    child: const Center(child: Text('Sign up')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Expanded(
                              child: TabBarView(
                            controller: tabController,
                            children: [
                              const DoctorOfficeLoginTab(
                                isdoctor: true,
                              ),
                              DoctorOfficeRegisterTab(
                                isofficedocor: widget.isofficedocor,
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
