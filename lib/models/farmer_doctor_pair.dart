class FarmerDoctorPair {
  final String farmerId;
  final String doctorLicense;
  final DateTime pairedAt;

  FarmerDoctorPair({
    required this.farmerId,
    required this.doctorLicense,
    required this.pairedAt,
  });

  factory FarmerDoctorPair.fromJson(Map<String, dynamic> json) => FarmerDoctorPair(
    farmerId: json['farmerId'] as String,
    doctorLicense: json['doctorLicense'] as String,
    pairedAt: DateTime.parse(json['pairedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'farmerId': farmerId,
    'doctorLicense': doctorLicense,
    'pairedAt': pairedAt.toIso8601String(),
  };
}