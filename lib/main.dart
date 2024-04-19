// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/splash_and_onboarding/views/splash_screen.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/thems/theme.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:zego_zimkit/zego_zimkit.dart';

Future<void> main() async {
  ZIMKit().init(
    appID: 465834652, // your appid
    appSign:
        '57e9606d6656818e9ba846d6104c345ca2af98c4a265d74d6bdadb2be7e35190', // your appSign
  );
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: "call_channel",
        channelName: "Call Channel",
        channelDescription: "Channel of Calling",
        defaultColor: Colors.red,
        ledColor: Colors.white,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        locked: true,
        defaultRingtoneType: DefaultRingtoneType.Ringtone)
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: Size(size.width, size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          builder: (BuildContext context, Widget? child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: 1),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Imedifix Service',
          theme: lightThemeData(context),
          themeMode: ThemeMode.light,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          home: SplashScreen(),
        );
      },
    );
  }
}
