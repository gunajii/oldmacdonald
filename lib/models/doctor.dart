class Doctor {
  final String licenseNumber;
  final String name;
  final String email;
  final String phone;

  Doctor({
    required this.licenseNumber,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    licenseNumber: json['licenseNumber'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
  );

  Map<String, dynamic> toJson() => {
    'licenseNumber': licenseNumber,
    'name': name,
    'email': email,
    'phone': phone,
  };
}