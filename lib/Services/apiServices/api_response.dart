import 'package:idaawee/Services/apiServices/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? massage;

  ApiResponse(this.status, this.data, this.massage);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETEDM;
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status?$status\n Massage:$massage \n Data:$data";
  }
}
