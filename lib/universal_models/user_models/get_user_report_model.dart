class Prescription {
  final String id;
  final String userId;
  final String doctorId;
  final String name;
  final String quantity;
  final String days;
  final bool morning;
  final bool afternoon;
  final bool evening;
  final bool night;
  final int v;

  Prescription({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.name,
    required this.quantity,
    required this.days,
    required this.morning,
    required this.afternoon,
    required this.evening,
    required this.night,
    required this.v,
  });

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      id: json['_id'] as String? ??
          '', // Providing a default empty string if null
      userId: json['userId'] as String? ?? '',
      doctorId: json['doc_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      quantity: json['quantity'] as String? ?? '',
      days: json['days'] as String? ?? '',
      morning: json['morning'] ?? false,
      afternoon: json['afternoon'] ?? false,
      evening: json['evening'] ?? false,
      night: json['night'] ?? false,
      v: json['__v'] ?? 0,
    );
  }
}

class DoctorDetails {
  final String id;
  final String image;
  final String name;
  final String email;
  final String password;
  final String specialization;
  final String conditionsTreated;
  final String aboutSelf;
  final String education;
  final String college;
  final String license;

  DoctorDetails({
    required this.id,
    required this.image,
    required this.name,
    required this.email,
    required this.password,
    required this.specialization,
    required this.conditionsTreated,
    required this.aboutSelf,
    required this.education,
    required this.college,
    required this.license,
  });

  factory DoctorDetails.fromJson(Map<String, dynamic> json) {
    return DoctorDetails(
      id: json['_id'],
      image: json['image'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      specialization: json['specialization'],
      conditionsTreated: json['conditionstreated'],
      aboutSelf: json['aboutself'],
      education: json['education'],
      college: json['college'],
      license: json['license'],
    );
  }
}

class PrescriptionResponse {
  final Prescription prescription;
  final DoctorDetails doctorDetails;

  PrescriptionResponse({
    required this.prescription,
    required this.doctorDetails,
  });

  factory PrescriptionResponse.fromJson(Map<String, dynamic> json) {
    return PrescriptionResponse(
      prescription: Prescription.fromJson(json['_doc']),
      doctorDetails: DoctorDetails.fromJson(json['doctorDetails']),
    );
  }
}
