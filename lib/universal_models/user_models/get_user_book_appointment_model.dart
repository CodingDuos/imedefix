class GetUserBookAppointmentsModel {
  AppointmentDetails? appointmentDetails;
  DoctorDetails? doctorDetails;

  GetUserBookAppointmentsModel({this.appointmentDetails, this.doctorDetails});

  GetUserBookAppointmentsModel.fromJson(Map<String, dynamic> json) {
    appointmentDetails = json['appointmentDetails'] != null
        ? new AppointmentDetails.fromJson(json['appointmentDetails'])
        : null;
    doctorDetails = json['doctorDetails'] != null
        ? new DoctorDetails.fromJson(json['doctorDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointmentDetails != null) {
      data['appointmentDetails'] = this.appointmentDetails!.toJson();
    }
    if (this.doctorDetails != null) {
      data['doctorDetails'] = this.doctorDetails!.toJson();
    }
    return data;
  }
}

class AppointmentDetails {
  String? sId;
  String? docId;
  String? userId;
  String? expiryYear;
  String? expiryMonth;
  String? cvv;
  String? cardNumber;
  String? cardName;
  String? selectedDate;
  String? selectedTimeSlot;
  String? bookingDate;
  int? iV;

  AppointmentDetails(
      {this.sId,
      this.docId,
      this.userId,
      this.expiryYear,
      this.expiryMonth,
      this.cvv,
      this.cardNumber,
      this.cardName,
      this.selectedDate,
      this.selectedTimeSlot,
      this.bookingDate,
      this.iV});

  AppointmentDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    docId = json['doc_id'];
    userId = json['userId'];
    expiryYear = json['expiryYear'];
    expiryMonth = json['expiryMonth'];
    cvv = json['cvv'];
    cardNumber = json['cardNumber'];
    cardName = json['cardName'];
    selectedDate = json['selectedDate'];
    selectedTimeSlot = json['selectedTimeSlot'];
    bookingDate = json['bookingDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['doc_id'] = this.docId;
    data['userId'] = this.userId;
    data['expiryYear'] = this.expiryYear;
    data['expiryMonth'] = this.expiryMonth;
    data['cvv'] = this.cvv;
    data['cardNumber'] = this.cardNumber;
    data['cardName'] = this.cardName;
    data['selectedDate'] = this.selectedDate;
    data['selectedTimeSlot'] = this.selectedTimeSlot;
    data['bookingDate'] = this.bookingDate;
    data['__v'] = this.iV;
    return data;
  }
}

class DoctorDetails {
  String? sId;
  String? image;
  String? name;
  String? email;
  String? password;
  String? specialization;
  String? conditionstreated;
  String? aboutself;
  String? education;
  String? college;
  String? license;
  String? yearofexperience;
  List<Once>? once;
  List<Daily>? daily;
  List<Weekly>? weekly;
  int? iV;

  DoctorDetails(
      {this.sId,
      this.image,
      this.name,
      this.email,
      this.password,
      this.specialization,
      this.conditionstreated,
      this.aboutself,
      this.education,
      this.college,
      this.license,
      this.yearofexperience,
      this.once,
      this.daily,
      this.weekly,
      this.iV});

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    specialization = json['specialization'];
    conditionstreated = json['conditionstreated'];
    aboutself = json['aboutself'];
    education = json['education'];
    college = json['college'];
    license = json['license'];
    yearofexperience = json['yearofexperience'];
    if (json['once'] != null) {
      once = <Once>[];
      json['once'].forEach((v) {
        once!.add(new Once.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily!.add(new Daily.fromJson(v));
      });
    }
    if (json['weekly'] != null) {
      weekly = <Weekly>[];
      json['weekly'].forEach((v) {
        weekly!.add(new Weekly.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['specialization'] = this.specialization;
    data['conditionstreated'] = this.conditionstreated;
    data['aboutself'] = this.aboutself;
    data['education'] = this.education;
    data['college'] = this.college;
    data['license'] = this.license;
    data['yearofexperience'] = this.yearofexperience;
    if (this.once != null) {
      data['once'] = this.once!.map((v) => v.toJson()).toList();
    }
    if (this.daily != null) {
      data['daily'] = this.daily!.map((v) => v.toJson()).toList();
    }
    if (this.weekly != null) {
      data['weekly'] = this.weekly!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Once {
  String? date;
  String? timefrom;
  String? timetill;
  String? consultationfees;
  String? sId;

  Once(
      {this.date,
      this.timefrom,
      this.timetill,
      this.consultationfees,
      this.sId});

  Once.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timefrom = json['timefrom'];
    timetill = json['timetill'];
    consultationfees = json['consultationfees'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['timefrom'] = this.timefrom;
    data['timetill'] = this.timetill;
    data['consultationfees'] = this.consultationfees;
    data['_id'] = this.sId;
    return data;
  }
}

class Daily {
  String? datefrom;
  String? datetill;
  String? timefrom;
  String? timetill;
  String? consultationfees;
  String? sId;

  Daily(
      {this.datefrom,
      this.datetill,
      this.timefrom,
      this.timetill,
      this.consultationfees,
      this.sId});

  Daily.fromJson(Map<String, dynamic> json) {
    datefrom = json['datefrom'];
    datetill = json['datetill'];
    timefrom = json['timefrom'];
    timetill = json['timetill'];
    consultationfees = json['consultationfees'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datefrom'] = this.datefrom;
    data['datetill'] = this.datetill;
    data['timefrom'] = this.timefrom;
    data['timetill'] = this.timetill;
    data['consultationfees'] = this.consultationfees;
    data['_id'] = this.sId;
    return data;
  }
}

class Weekly {
  String? day;
  String? timefrom;
  String? timetill;
  String? consultationfees;
  String? sId;

  Weekly(
      {this.day,
      this.timefrom,
      this.timetill,
      this.consultationfees,
      this.sId});

  Weekly.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    timefrom = json['timefrom'];
    timetill = json['timetill'];
    consultationfees = json['consultationfees'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['timefrom'] = this.timefrom;
    data['timetill'] = this.timetill;
    data['consultationfees'] = this.consultationfees;
    data['_id'] = this.sId;
    return data;
  }
}
