import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';

import '../../../../commons/common_imports/apis_commons.dart';
import '../../../../commons/common_imports/common_libs.dart';

final dProfileMainprovider =
    ChangeNotifierProvider((ref) => DProfileController());

class DProfileController extends ChangeNotifier {
  bool isedit = false;
  bool get index => isedit;
  setIndex(bool isedits) {
    print('object fsssssssssss');
    print(isedits);
    isedit = isedits;
    print('object');
    print(isedit);
    notifyListeners();
  }
}
