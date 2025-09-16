import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  String? _currentFarmerId;
  String? _currentDoctorLicense;
  bool _isLoggedIn = false;

  String? get currentFarmerId => _currentFarmerId;
  String? get currentDoctorLicense => _currentDoctorLicense;
  bool get isLoggedIn => _isLoggedIn;

  void loginAsFarmer(String farmerId) {
    _currentFarmerId = farmerId;
    _currentDoctorLicense = null;
    _isLoggedIn = true;
    notifyListeners();
  }

  void loginAsDoctor(String doctorLicense) {
    _currentDoctorLicense = doctorLicense;
    _currentFarmerId = null;
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _currentFarmerId = null;
    _currentDoctorLicense = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}