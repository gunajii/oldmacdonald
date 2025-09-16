import 'package:flutter/foundation.dart';
import '../models/animal.dart';

class AnimalProvider with ChangeNotifier {
  final List<Animal> _animals = [];

  List<Animal> get animals => _animals;

  List<Animal> getAnimalsByFarmer(String farmerId) {
    return _animals.where((animal) => animal.farmerId == farmerId).toList();
  }

  void addAnimal(Animal animal) {
    _animals.add(animal);
    notifyListeners();
  }

  void updateAnimalStatus(String animalId, DateTime meatUnsafeUntil, DateTime dairyUnsafeUntil) {
    final index = _animals.indexWhere((animal) => animal.animalId == animalId);
    if (index != -1) {
      _animals[index] = Animal(
        animalId: _animals[index].animalId,
        farmerId: _animals[index].farmerId,
        type: _animals[index].type,
        breed: _animals[index].breed,
        dobIso: _animals[index].dobIso,
        sex: _animals[index].sex,
        notes: _animals[index].notes,
        meatUnsafeUntilIso: meatUnsafeUntil.toIso8601String(),
        dairyUnsafeUntilIso: dairyUnsafeUntil.toIso8601String(),
        reportIds: _animals[index].reportIds,
      );
      notifyListeners();
    }
  }
}