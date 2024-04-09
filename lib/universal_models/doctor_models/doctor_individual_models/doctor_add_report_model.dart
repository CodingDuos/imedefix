class DoctorAddReportModel {
  final String? userId;
  final String? docId;
  final String? name;
  final int? quantity;
  final String? image;
  final int? days;
  final bool? morning;
  final bool? afternoon;
  final bool? evening;
  final bool? night;
  final String? reportTitle;
  final String? reportCategory;

  DoctorAddReportModel({
    required this.userId,
    required this.docId,
    required this.image,
    this.name,
    this.quantity,
    this.days,
    this.morning,
    this.afternoon,
    this.evening,
    this.night,
    required this.reportTitle,
    required this.reportCategory,
  });

  factory DoctorAddReportModel.fromJson(Map<String, dynamic> json) {
    return DoctorAddReportModel(
      userId: json['userId'] ?? '',
      docId: json['doc_id'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
      days: json['days'] ?? 0,
      morning: json['morning'] ?? false,
      afternoon: json['afternoon'] ?? false,
      evening: json['evening'] ?? false,
      night: json['night'] ?? false,
      reportTitle: json['reporttitle'] ?? '',
      reportCategory: json['reportcagatory'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'doc_id': docId,
      'name': name,
      'image': image,
      'quantity': quantity,
      'days': days,
      'morning': morning,
      'afternoon': afternoon,
      'evening': evening,
      'night': night,
      'reporttitle': reportTitle,
      'reportcagatory': reportCategory,
    };
  }
}
