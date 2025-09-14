import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  const AnimalCard({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Animal ID: ${animal.animalId}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Breed: ${animal.breed}'),
            Text('Type: ${animal.type}'),
            if (animal.dobIso != null) Text('DOB: ${animal.dobIso}'),
            if (animal.sex != null) Text('Sex: ${animal.sex}'),
            if (animal.meatUnsafeUntilIso != null)
              Text('Meat unsafe until: ${animal.meatUnsafeUntilIso}'),
            if (animal.dairyUnsafeUntilIso != null)
              Text('Dairy unsafe until: ${animal.dairyUnsafeUntilIso}'),
          ],
        ),
      ),
    );
  }
}