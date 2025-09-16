import 'package:flutter/foundation.dart';
import '../models/farmer_doctor_pair.dart';
import '../models/farmer.dart';
import '../models/doctor.dart';

class PairProvider with ChangeNotifier {
  final List<FarmerDoctorPair> _pairs = [];
  final List<Farmer> _farmers = [];
  final List<Doctor> _doctors = [];

  void addPair(FarmerDoctorPair pair) {
    _pairs.add(pair);
    notifyListeners();
  }

  List<Farmer> getFarmersForDoctor(String doctorLicense) {
    final farmerIds = _pairs
        .where((pair) => pair.doctorLicense == doctorLicense)
        .map((pair) => pair.farmerId)
        .toList();

    return _farmers.where((farmer) => farmerIds.contains(farmer.farmerId)).toList();
  }

  List<Doctor> getDoctorsForFarmer(String farmerId) {
    final doctorLicenses = _pairs
        .where((pair) => pair.farmerId == farmerId)
        .map((pair) => pair.doctorLicense)
        .toList();

    return _doctors.where((doctor) => doctorLicenses.contains(doctor.licenseNumber)).toList();
  }

  void addFarmer(Farmer farmer) {
    _farmers.add(farmer);
    notifyListeners();
  }

  void addDoctor(Doctor doctor) {
    _doctors.add(doctor);
    notifyListeners();
  }

  Farmer? getFarmerById(String farmerId) {
    try {
      return _farmers.firstWhere((farmer) => farmer.farmerId == farmerId);
    } catch (e) {
      return null;
    }
  }

  Doctor? getDoctorByLicense(String license) {
    try {
      return _doctors.firstWhere((doctor) => doctor.licenseNumber == license);
    } catch (e) {
      return null;
    }
  }
}