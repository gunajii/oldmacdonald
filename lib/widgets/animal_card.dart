import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  const AnimalCard({super.key, required this.animal});

  String getMRLStatus() {
    final now = DateTime.now();
    final meatUnsafeUntil = animal.meatUnsafeUntilIso != null
        ? DateTime.parse(animal.meatUnsafeUntilIso!)
        : null;
    final dairyUnsafeUntil = animal.dairyUnsafeUntilIso != null
        ? DateTime.parse(animal.dairyUnsafeUntilIso!)
        : null;

    if (meatUnsafeUntil != null && meatUnsafeUntil.isAfter(now)) {
      return 'Meat: Unsafe for consumption';
    }
    if (dairyUnsafeUntil != null && dairyUnsafeUntil.isAfter(now)) {
      return 'Dairy: Unsafe for consumption';
    }
    return 'Safe for consumption';
  }

  Color getMRLStatusColor() {
    final status = getMRLStatus();
    if (status == 'Safe for consumption') {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Animal type/name on top
            Text(
              '${animal.type} - ${animal.breed}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Animal ID below in smaller font
            Text(
              'ID: ${animal.animalId}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Divider(),
            if (animal.dobIso != null) Text('DOB: ${animal.dobIso}'),
            if (animal.sex != null) Text('Sex: ${animal.sex}'),
            if (animal.meatUnsafeUntilIso != null)
              Text('Meat unsafe until: ${animal.meatUnsafeUntilIso}'),
            if (animal.dairyUnsafeUntilIso != null)
              Text('Dairy unsafe until: ${animal.dairyUnsafeUntilIso}'),
            SizedBox(height: 8),
            Divider(),
            Text(
              'MRL Status: ${getMRLStatus()}',
              style: TextStyle(
                color: getMRLStatusColor(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}