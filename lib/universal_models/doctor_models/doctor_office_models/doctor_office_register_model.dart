class DoctorOficeRegisterModel {
  int? id;
  String? token;

  DoctorOficeRegisterModel({this.id, this.token});

  DoctorOficeRegisterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    return data;
  }
}
