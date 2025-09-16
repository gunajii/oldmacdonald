class Farmer {
  final String farmerId;
  final String name;
  final String farmName;
  final String contact;
  final String email;
  final String dateOfBirth;
  final String farmLocation;

  Farmer({
    required this.farmerId,
    required this.name,
    required this.farmName,
    required this.contact,
    required this.email,
    required this.dateOfBirth,
    required this.farmLocation,
  });

  factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
    farmerId: json['farmerId'] as String,
    name: json['name'] as String,
    farmName: json['farmName'] as String,
    contact: json['contact'] as String,
    email: json['email'] as String,
    dateOfBirth: json['dateOfBirth'] as String,
    farmLocation: json['farmLocation'] as String,
  );

  Map<String, dynamic> toJson() => {
    'farmerId': farmerId,
    'name': name,
    'farmName': farmName,
    'contact': contact,
    'email': email,
    'dateOfBirth': dateOfBirth,
    'farmLocation': farmLocation,
  };
}