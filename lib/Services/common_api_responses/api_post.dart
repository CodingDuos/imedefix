import 'dart:convert';

import 'package:http/http.dart' as http;

class CommonApiServicePostData {
  static postApiData(Uri uri, Map<String, dynamic> data,
      List<ResponsesDataHandleModel> responseHandleList) async {
    try {
      var response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      bool handled = false;
      for (var element in responseHandleList) {
        if (element.statuscode == response.statusCode) {
          element.function(response.body);
          handled = true;
          break;
        }
      }

      if (!handled) {
        for (var element in responseHandleList) {
          if (element.statuscode == null) {
            element.function(response.body);
            break;
          }
        }
      }
    } catch (error) {
      print('Error : $error');
    }
  }
}

class ResponsesDataHandleModel {
  int? statuscode;
  void Function(String responseBody) function;

  ResponsesDataHandleModel({
    this.statuscode,
    required this.function,
  });
}
