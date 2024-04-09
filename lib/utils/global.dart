import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/splash_and_onboarding/views/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static int index = 0;
  static int index1 = 0;
  static String userId = '';
  Global() {}

  Future<void> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', userId);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  Future<void> removeUserId(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => SplashScreen())));
  }

  Future<void> saveUserindex(String userIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_index', userIndex);
  }

  Future<String?> getUserindex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_index');
  }
}
