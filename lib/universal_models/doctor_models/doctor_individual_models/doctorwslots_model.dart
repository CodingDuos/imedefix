class DoctorAvailability {
  Session1? session1;
  Session1? session2;
  String? sId;
  String? docId;
  String? date;
  int? iV;

  DoctorAvailability(
      {this.session1, this.session2, this.sId, this.docId, this.date, this.iV});

  DoctorAvailability.fromJson(Map<String, dynamic> json) {
    session1 = json['session1'] != null
        ? new Session1.fromJson(json['session1'])
        : null;
    session2 = json['session2'] != null
        ? new Session1.fromJson(json['session2'])
        : null;
    sId = json['_id'];
    docId = json['doc_id'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.session1 != null) {
      data['session1'] = this.session1!.toJson();
    }
    if (this.session2 != null) {
      data['session2'] = this.session2!.toJson();
    }
    data['_id'] = this.sId;
    data['doc_id'] = this.docId;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}

class Session1 {
  String? startTime;
  String? endTime;

  Session1({this.startTime, this.endTime});

  Session1.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}
