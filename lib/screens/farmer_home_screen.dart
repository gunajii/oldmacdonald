import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/animal_provider.dart';
import '../widgets/animal_card.dart';

class FarmerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final animalProvider = Provider.of<AnimalProvider>(context);
    final animals = animalProvider.animals;

    return Scaffold(
      appBar: AppBar(title: Text('Farmer Dashboard')),
      body: animals.isEmpty
          ? Center(child: Text('No animals registered'))
          : ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) => AnimalCard(animal: animals[index]),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'addReport',
            onPressed: () => Navigator.pushNamed(context, '/addReport'),
            child: Icon(Icons.note_add),
            tooltip: 'Add Report',
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'registerAnimal',
            onPressed: () => Navigator.pushNamed(context, '/registerAnimal'),
            child: Icon(Icons.pets),
            tooltip: 'Register Animal',
          ),
        ],
      ),
    );
  }
}