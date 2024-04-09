import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';
import 'package:idaawee/universal_models/user_models/get_user_report_model.dart';
import 'package:idaawee/utils/global.dart';

class UserReportprovider extends GetxController {
  ApiServices service = ApiServices();

  UserReportprovider() {
    init();
  }

  String? userId;
  init() async {
    String? useresid = await Global().getUserId();
    userId = useresid!.replaceAll(RegExp(r'^"|"$'), '');
    print(" home provider screen user id ${userId}");
    if (userId != null) {
      await getAllUserReport(userId!);

      print(' user id =====>>>>> luqmana $userId ');
    } else {
      print('user id null  ------->>> ');
    }
  }

  final UserallReport = <PrescriptionResponse>[].obs;

  getAllUserReport(docId) async {
    try {
      print('user  report  method calling ===>>> ');
      final List<PrescriptionResponse> data =
          await service.getAllUserReport(docId);

      // If ComfromAppopintmentList is a list and you want to replace its contents
      UserallReport.assignAll(data); // Directly assign the new list

      print(' user  report  list lenght: ${UserallReport.length}');
      if (UserallReport.isNotEmpty) {
        print(
            'Username of the doctor: ${UserallReport[0].doctorDetails?.name ?? "No booking date"}');
      }
    } catch (e) {
      print("Error  report lenght  details: $e");
    }
  }
}
