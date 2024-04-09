import 'dart:convert';
import 'dart:io';

class DoctorIndRegisterModel {
  String? imageBase64;
  String? name;
  String? email;
  String? password;
  String? specialization;
  String? conditionstreatment;
  String? aboutself;
  String? education;
  String? colloge;
  String? license;
  String? yearofexperience;
  Once? once;
  Daily? daily;
  Weekly? weekly;

  DoctorIndRegisterModel(
      {this.imageBase64,
      this.name,
      this.email,
      this.password,
      this.specialization,
      this.conditionstreatment,
      this.aboutself,
      this.education,
      this.colloge,
      this.license,
      this.yearofexperience,
      this.once,
      this.daily,
      this.weekly});

  DoctorIndRegisterModel.fromJson(Map<String, dynamic> json) {
    imageBase64 = json['imageBase64'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    specialization = json['specialization'];
    conditionstreatment = json['conditionstreatment'];
    aboutself = json['aboutself'];
    education = json['education'];
    colloge = json['colloge'];
    license = json['license'];
    yearofexperience = json['yearofexperience'];
    once = json['once'] != null ? new Once.fromJson(json['once']) : null;
    daily = json['daily'] != null ? new Daily.fromJson(json['daily']) : null;
    weekly =
        json['weekly'] != null ? new Weekly.fromJson(json['weekly']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageBase64'] = this.imageBase64;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['specialization'] = this.specialization;
    data['conditionstreatment'] = this.conditionstreatment;
    data['aboutself'] = this.aboutself;
    data['education'] = this.education;
    data['colloge'] = this.colloge;
    data['license'] = this.license;
    data['yearofexperience'] = this.yearofexperience;
    if (this.once != null) {
      data['once'] = this.once!.toJson();
    }
    if (this.daily != null) {
      data['daily'] = this.daily!.toJson();
    }
    if (this.weekly != null) {
      data['weekly'] = this.weekly!.toJson();
    }
    return data;
  }

  Future<void> setImageFile(File file) async {
    List<int> imageBytes = await file.readAsBytes();
    imageBase64 = base64Encode(imageBytes);
  }

  // Method to convert the base64 string back to an image file
  // Ensure you have the right permissions to write files
  Future<File?> getImageFile(String directoryPath) async {
    if (imageBase64 == null) return null;

    List<int> imageBytes = base64Decode(imageBase64!);
    String tempFileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    String filePath =
        '$directoryPath/$tempFileName'; // Specify the directory path where the file should be saved
    await File(filePath).writeAsBytes(imageBytes);
    return File(filePath);
  }
}

class Once {
  String? oncedate;
  String? oncetimefrom;
  String? oncetimetill;
  String? consultationfees;

  Once(
      {this.oncedate,
      this.oncetimefrom,
      this.oncetimetill,
      this.consultationfees});

  Once.fromJson(Map<String, dynamic> json) {
    oncedate = json['oncedate'];
    oncetimefrom = json['oncetimefrom'];
    oncetimetill = json['oncetimetill'];
    consultationfees = json['consultationfees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oncedate'] = this.oncedate;
    data['oncetimefrom'] = this.oncetimefrom;
    data['oncetimetill'] = this.oncetimetill;
    data['consultationfees'] = this.consultationfees;
    return data;
  }
}

class Daily {
  String? dailydatefrom;
  String? dailydatetill;
  String? dailytimefrom;
  String? dailytimetill;
  String? dailyconsultationfree;

  Daily(
      {this.dailydatefrom,
      this.dailydatetill,
      this.dailytimefrom,
      this.dailytimetill,
      this.dailyconsultationfree});

  Daily.fromJson(Map<String, dynamic> json) {
    dailydatefrom = json['dailydatefrom'];
    dailydatetill = json['dailydatetill'];
    dailytimefrom = json['dailytimefrom'];
    dailytimetill = json['dailytimetill'];
    dailyconsultationfree = json['dailyconsultationfree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailydatefrom'] = this.dailydatefrom;
    data['dailydatetill'] = this.dailydatetill;
    data['dailytimefrom'] = this.dailytimefrom;
    data['dailytimetill'] = this.dailytimetill;
    data['dailyconsultationfree'] = this.dailyconsultationfree;
    return data;
  }
}

class Weekly {
  String? weeklyday;
  String? weektimefrom;
  String? weektimetill;
  String? weekconsultationfree;

  Weekly(
      {this.weeklyday,
      this.weektimefrom,
      this.weektimetill,
      this.weekconsultationfree});

  Weekly.fromJson(Map<String, dynamic> json) {
    weeklyday = json['weeklyday'];
    weektimefrom = json['weektimefrom'];
    weektimetill = json['weektimetill'];
    weekconsultationfree = json['weekconsultationfree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weeklyday'] = this.weeklyday;
    data['weektimefrom'] = this.weektimefrom;
    data['weektimetill'] = this.weektimetill;
    data['weekconsultationfree'] = this.weekconsultationfree;
    return data;
  }
}
