class Appointment {
  final String id;
  final String docId;
  final String userId;

  Appointment({required this.id, required this.docId, required this.userId});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      docId: json['docId'],
      userId: json['userId'],
    );
  }
}

class Patient {
  final String id;
  final String username;
  final String email;
  final String password;

  Patient({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}

class GetAppointmentDetails {
  final Appointment appointmentDetails;
  final Patient patientDetails;

  GetAppointmentDetails({required this.appointmentDetails, required this.patientDetails});

  factory GetAppointmentDetails.fromJson(Map<String, dynamic> json) {
    return GetAppointmentDetails(
      appointmentDetails: Appointment.fromJson(json['appointmentDetails']),
      patientDetails: Patient.fromJson(json['PatietnDetails']), // Correct the key based on your JSON structure
    );
  }
}
