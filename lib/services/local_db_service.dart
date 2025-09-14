import 'package:hive/hive.dart';
import 'dart:convert';
import '../models/animal.dart';
import '../models/report.dart';
import '../models/drug_defaults.dart';

class LocalDbService {
  static const String animalsBox = 'animals';
  static const String reportsBox = 'reports';
  static const String drugDefaultsBox = 'drug_defaults';

  Future<void> init() async {
    // Hive initialization would typically happen here
  }

  Future<void> addAnimal(Animal animal) async {
    final box = await Hive.openBox(animalsBox);
    await box.put(animal.animalId, jsonEncode(animal.toJson()));
  }

  List<Animal> getAllAnimals() {
    final box = Hive.box(animalsBox);
    return box.values.map((e) {
      final Map<String, dynamic> json = jsonDecode(e as String);
      return Animal.fromJson(json);
    }).toList();
  }

  Animal? getAnimal(String animalId) {
    final box = Hive.box(animalsBox);
    final stored = box.get(animalId);
    if (stored == null) return null;
    final Map<String, dynamic> json = jsonDecode(stored as String);
    return Animal.fromJson(json);
  }

  Future<void> upsertAnimal(Animal a) async {
    final box = await Hive.openBox(animalsBox);
    await box.put(a.animalId, jsonEncode(a.toJson()));
  }

  // Reports
  Future<void> addReport(Report r) async {
    final box = await Hive.openBox(reportsBox);
    await box.put(r.reportId, jsonEncode(r.toJson()));
  }

  List<Report> getAllReports() {
    final box = Hive.box(reportsBox);
    return box.values.map((e) {
      final Map<String, dynamic> json = jsonDecode(e as String);
      return Report.fromJson(json);
    }).toList();
  }

  List<Report> getReportsForAnimal(String animalId) {
    return getAllReports().where((r) => r.animalId == animalId).toList();
  }

  // Drug defaults
  Future<DrugDefaults> getDrugDefaults() async {
    final box = await Hive.openBox(drugDefaultsBox);
    final raw = box.get('map') as String?;
    if (raw == null) return DrugDefaults.fromJson({});
    final Map<String, dynamic> map = jsonDecode(raw);
    return DrugDefaults.fromJson(map);
  }

  Future<void> setDrugDefault(String drug, int meatDays, int dairyDays) async {
    final box = await Hive.openBox(drugDefaultsBox);
    final raw = box.get('map') as String?;
    final Map<String, dynamic> map = raw == null ? {} : jsonDecode(raw);
    map[drug] = {'meatDays': meatDays, 'dairyDays': dairyDays};
    await box.put('map', jsonEncode(map));
  }
}