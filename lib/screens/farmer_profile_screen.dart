import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/animal_provider.dart';
import '../providers/pair_provider.dart';

class FarmerProfileScreen extends StatelessWidget {
  const FarmerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final farmerId = ModalRoute.of(context)!.settings.arguments as String;
    final pairProvider = Provider.of<PairProvider>(context);
    final animalProvider = Provider.of<AnimalProvider>(context);

    final farmer = pairProvider.getFarmerById(farmerId);
    final animals = animalProvider.getAnimalsByFarmer(farmerId);

    return Scaffold(
      appBar: AppBar(title: Text('Farmer Profile')),
      body: farmer == null
          ? Center(child: Text('Farmer not found'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${farmer.name}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Mobile: ${farmer.contact}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Date of Birth: ${farmer.dateOfBirth}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Total Animals: ${animals.length}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Farm Name: ${farmer.farmName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: ${farmer.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Location: ${farmer.farmLocation}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}