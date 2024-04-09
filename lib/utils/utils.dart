import 'package:date_picker_timeline/extra/color.dart';
import 'package:intl/intl.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static toastMassage(String massage) {
    Fluttertoast.showToast(
      msg: massage,
      backgroundColor: AppColors.defaultDayColor,
      gravity: ToastGravity.BOTTOM,
    );
  }

  // static void showCustomSnackbar(
  //     BuildContext context, String title, String message) {
  //   final snackBar = SnackBar(
  //     // duration: Duration(microseconds: 2000),
  //     content: Text(message),
  //     backgroundColor: Colors.blue, // Customize background color
  //     behavior: SnackBarBehavior.floating, // Make it floating
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20)), // Add rounded corners
  //     action: SnackBarAction(
  //       label: title,
  //       onPressed: () {},
  //     ),
  //   );

  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
}

Widget spacer({double height = 16}) {
  return SizedBox(
    height: height,
  );
}

DateTime getDateTimeFromUnix(int dt) =>
    DateTime.fromMillisecondsSinceEpoch(dt * 1000);

String getTimeInHour(int dt) {
  final curDt = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  final hour = DateFormat('hh a').format(curDt);
  return hour;
}

String getTimeInHHMM(int dt) {
  final curDt = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  final hour = DateFormat('hh:mm a').format(curDt);
  return hour;
}

String getDayFromEpoch(int dt) {
  final curDt = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  final day = DateFormat('EEEE').format(curDt);
  return day;
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key, this.message = "Something went wrong !"})
      : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: getMediumStyle(
            fontSize: 12.spMin, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}

class NoRecordFound extends StatelessWidget {
  const NoRecordFound({Key? key, this.message = "No Records"})
      : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: getMediumStyle(
            fontSize: 12.spMin, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
