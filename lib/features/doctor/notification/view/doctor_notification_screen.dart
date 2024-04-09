import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/features/doctor/notification/widgets/d_invitation_section.dart';
import 'package:idaawee/features/doctor/notification/widgets/d_notification_section.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class DoctorNotificationScreen extends StatelessWidget {
  const DoctorNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                toolbarHeight: 120.h,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20.h,
                    color: MyColors.black94,
                  ),
                ),
                centerTitle: true,
                title: Text(
                  notification,
                  style: getSemiBoldStyle(
                      color: MyColors.black94, fontSize: MyFonts.size18),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Container(
                            height: 40.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 0.8))),
                            child: TabBar(
                              unselectedLabelColor: MyColors.black,
                              unselectedLabelStyle: getMediumStyle(
                                  color: MyColors.black,
                                  fontSize: MyFonts.size16),
                              labelColor: MyColors.black,
                              labelStyle: getMediumStyle(
                                  color: MyColors.black,
                                  fontSize: MyFonts.size16),
                              indicatorColor: Colors.blue,
                              indicator: const UnderlineTabIndicator(
                                borderSide: BorderSide(
                                    color: MyColors.appColor, width: 2.0),
                              ),
                              tabs: const [
                                Text(
                                  notification,
                                ),
                                Text(
                                  invitation,
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                )),
            body: const TabBarView(
              children: [DNotificationSection(), DInvitationSection()],
            )));
  }
}
