import 'package:idaawee/features/user/home/view/user_home_screen.dart';
import 'package:idaawee/features/user/record_screen/view/record_screen.dart';
import 'package:idaawee/features/user/report/view/user_report_screen.dart';
import 'package:idaawee/features/user/user_profile/view/user_profile_screen.dart';
import '../../../../commons/common_imports/apis_commons.dart';
import '../../../../commons/common_imports/common_libs.dart';

final mainMenuProvider = ChangeNotifierProvider((ref) => MainMenuController());

class MainMenuController extends ChangeNotifier {
  // final controller = Get.put(UserHomeScreenProvider());
  List<Widget> screens = [
    UserHomeScreen(),
    const UserReportScreen(),
    Container(),
    RecordScreen(),
    const user_profile()
  ];

  int _index = 0;
  int get index => _index;
  setIndex(int id) {
    _index = id;
    notifyListeners();
  }
}
