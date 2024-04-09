class ConformOppointmentModel {
  final String? fees;
  final String? bookingDate;
  final String? bookingFor;
  final String? docId;
  final String? _id; // Private field
  final String? gender;
  final String? patientAge;
  final String? selectedDate;
  final String? selectedTimeSlot;
  final String? userId;

  ConformOppointmentModel({
    this.fees,
    this.bookingDate,
    this.bookingFor,
    required String? id, // Public parameter for setting private _id
    this.docId,
    this.gender,
    this.patientAge,
    this.selectedDate,
    this.selectedTimeSlot,
    this.userId,
  }) : _id = id; // Assigning the public parameter to the private field

  factory ConformOppointmentModel.fromJson(Map<String, dynamic> json) {
    return ConformOppointmentModel(
      fees: json['fees'],
      bookingDate: json['bookingDate'],
      bookingFor: json['bookingFor'],
      id: json['_id'], // Using the public parameter
      docId: json['doc_id'],
      gender: json['gender'],
      patientAge: json['patientAge'],
      selectedDate: json['selectedDate'],
      selectedTimeSlot: json['selectedTimeSlot'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fees': fees,
      'bookingDate': bookingDate,
      'bookingFor': bookingFor,
      'doc_id': docId,
      'gender': gender,
      'patientAge': patientAge,
      'selectedDate': selectedDate,
      'selectedTimeSlot': selectedTimeSlot,
      'userId': userId,
      '_id': _id,
    };
  }

  // Getter method to access _id
  String? get id => _id;
}
