import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/apis_commons.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';

import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/features/doctor/doctorwallet/widgets/walletlistile.dart';
import 'package:idaawee/routes/route_manager.dart';

import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DoctorwalletScreen extends ConsumerStatefulWidget {
  const DoctorwalletScreen({
    super.key,
  });

  @override
  ConsumerState<DoctorwalletScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends ConsumerState<DoctorwalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
    // final mainMenuCtr = ref.watch(dProfileMainprovider);
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
                        child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ))),
                      ),
                      Positioned(
                        top: 35.h,
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
                                    'Wallet',
                                    style: getBoldStyle(
                                        color: MyColors.black,
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
                  child: DoctorwalletPoint(
                    onPressed: () {},
                    tabController: _tabController,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorwalletPoint extends StatelessWidget {
  DoctorwalletPoint(
      {super.key, required this.onPressed, required this.tabController});
  final VoidCallback onPressed;
  final TabController tabController;

  final TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -120,
          left: 0,
          right: 0,
          child: Container(
            height: 160,
            color: Colors.white.withOpacity(0.30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/wallepng.png',
                        height: 30,
                        width: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            'Total Earning:',
                            style: getBoldStyle(color: MyColors.white),
                          ),
                          Text(
                            '\$1354.46',
                            style: getBoldStyle(
                                color: MyColors.white, fontSize: 23),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Available Balance',
                        style: getBoldStyle(color: MyColors.white),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$1612.458',
                            style: getBoldStyle(
                                color: MyColors.black, fontSize: 23),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: 1.sw,
          decoration: const BoxDecoration(
            color: MyColors.lightBg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
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
                            child: const Center(child: Text('ALL')),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 170.w,
                            child: const Center(child: Text('Earning')),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 170.w,
                            child: const Center(child: Text('Withdraw')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  padding10,
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return const DoctorWalletListtile();
                          })),
                  NextButton(
                      back: () {},
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.doctorwalletAmountScreen);
                      },
                      isbackbuton: false,
                      text: 'Wallet Withdraw')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
