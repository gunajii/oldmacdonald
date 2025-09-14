class Report {
  final String reportId;
  final String animalId;
  final String drugName;
  final String administeredDateIso;
  final String reason;
  final String? doctorName;
  final String? notes;
  final int? meatWithdrawalDays;
  final int? dairyWithdrawalDays;
  final String createdAtIso;

  Report({
    required this.reportId,
    required this.animalId,
    required this.drugName,
    required this.administeredDateIso,
    required this.reason,
    this.doctorName,
    this.notes,
    this.meatWithdrawalDays,
    this.dairyWithdrawalDays,
    required this.createdAtIso,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    reportId: json['reportId'] as String,
    animalId: json['animalId'] as String,
    drugName: json['drugName'] as String,
    administeredDateIso: json['administeredDateIso'] as String,
    reason: json['reason'] as String,
    doctorName: json['doctorName'] as String?,
    notes: json['notes'] as String?,
    meatWithdrawalDays: json['meatWithdrawalDays'] as int?,
    dairyWithdrawalDays: json['dairyWithdrawalDays'] as int?,
    createdAtIso: json['createdAtIso'] as String,
  );

  Map<String, dynamic> toJson() => {
    'reportId': reportId,
    'animalId': animalId,
    'drugName': drugName,
    'administeredDateIso': administeredDateIso,
    'reason': reason,
    'doctorName': doctorName,
    'notes': notes,
    'meatWithdrawalDays': meatWithdrawalDays,
    'dairyWithdrawalDays': dairyWithdrawalDays,
    'createdAtIso': createdAtIso,
  };
}