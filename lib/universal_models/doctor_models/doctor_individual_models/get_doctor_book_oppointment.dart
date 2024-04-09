class getDoctorBookOppointment {
  AppointmentDetails? appointmentDetails;
  PatietnDetails? patietnDetails;

  getDoctorBookOppointment({this.appointmentDetails, this.patietnDetails});

  getDoctorBookOppointment.fromJson(Map<String, dynamic> json) {
    appointmentDetails = json['appointmentDetails'] != null
        ? new AppointmentDetails.fromJson(json['appointmentDetails'])
        : null;
    patietnDetails = json['PatietnDetails'] != null
        ? new PatietnDetails.fromJson(json['PatietnDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointmentDetails != null) {
      data['appointmentDetails'] = this.appointmentDetails!.toJson();
    }
    if (this.patietnDetails != null) {
      data['PatietnDetails'] = this.patietnDetails!.toJson();
    }
    return data;
  }
}

class AppointmentDetails {
  String? sId;
  String? docId;
  String? userId;
  String? gender;
  String? patientAge;
  String? selectedDate;
  String? selectedTimeSlot;
  String? bookingDate;
  String? bookingFor;
  String? fees;
  int? iV;

  AppointmentDetails(
      {this.sId,
      this.docId,
      this.userId,
      this.gender,
      this.patientAge,
      this.selectedDate,
      this.selectedTimeSlot,
      this.bookingDate,
      this.bookingFor,
      this.fees,
      this.iV});

  AppointmentDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    docId = json['doc_id'];
    userId = json['userId'];
    gender = json['gender'];
    patientAge = json['patientAge'];
    selectedDate = json['selectedDate'];
    selectedTimeSlot = json['selectedTimeSlot'];
    bookingDate = json['bookingDate'];
    bookingFor = json['bookingFor'];
    fees = json['Fees'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['doc_id'] = this.docId;
    data['userId'] = this.userId;
    data['gender'] = this.gender;
    data['patientAge'] = this.patientAge;
    data['selectedDate'] = this.selectedDate;
    data['selectedTimeSlot'] = this.selectedTimeSlot;
    data['bookingDate'] = this.bookingDate;
    data['bookingFor'] = this.bookingFor;
    data['Fees'] = this.fees;
    data['__v'] = this.iV;
    return data;
  }
}

class PatietnDetails {
  String? sId;
  String? username;
  String? email;
  String? password;
  int? iV;

  PatietnDetails({this.sId, this.username, this.email, this.password, this.iV});

  PatietnDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['__v'] = this.iV;
    return data;
  }
}
