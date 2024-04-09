import 'package:date_picker_timeline/extra/color.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/common_app_bar.dart';

import '../../../../utils/constants/assets_manager.dart';

class SettingsPageScreen extends StatelessWidget {
  const SettingsPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        appBarTitle: 'Add Payments Method',
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/images/rightuser.png',
                  color: MyColors.appColor1,
                ),
                title: const Text('Change Password'),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: MyColors.appColor1,
                ),
              ),
              Divider(
                color: MyColors.grey.withOpacity(0.30),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/notification.png',
                  color: MyColors.appColor1,
                ),
                title: const Text('Notification Settings'),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: MyColors.appColor1,
                ),
              ),
              Divider(
                color: MyColors.grey.withOpacity(0.30),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/notifications.png',
                ),
                title: const Text(
                  'Delete Account',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
