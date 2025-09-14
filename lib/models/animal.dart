class Animal {
  final String animalId;
  final String type;
  final String breed;
  final String? dobIso;
  final String? sex;
  final String? notes;
  String? meatUnsafeUntilIso;
  String? dairyUnsafeUntilIso;
  List<String> reportIds;

  Animal({
    required this.animalId,
    required this.type,
    required this.breed,
    this.dobIso,
    this.sex,
    this.notes,
    this.meatUnsafeUntilIso,
    this.dairyUnsafeUntilIso,
    List<String>? reportIds,
  }) : reportIds = reportIds ?? [];

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
    animalId: json['animalId'] as String,
    type: json['type'] as String,
    breed: json['breed'] as String,
    dobIso: json['dobIso'] as String?,
    sex: json['sex'] as String?,
    notes: json['notes'] as String?,
    meatUnsafeUntilIso: json['meatUnsafeUntilIso'] as String?,
    dairyUnsafeUntilIso: json['dairyUnsafeUntilIso'] as String?,
    reportIds: List<String>.from(json['reportIds'] ?? []),
  );

  Map<String, dynamic> toJson() => {
    'animalId': animalId,
    'type': type,
    'breed': breed,
    'dobIso': dobIso,
    'sex': sex,
    'notes': notes,
    'meatUnsafeUntilIso': meatUnsafeUntilIso,
    'dairyUnsafeUntilIso': dairyUnsafeUntilIso,
    'reportIds': reportIds,
  };
}