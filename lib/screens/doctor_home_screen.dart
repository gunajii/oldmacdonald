import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/animal_provider.dart';
import '../providers/pair_provider.dart';
import '../widgets/animal_card.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  _DoctorHomeScreenState createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  String? _selectedFarmerId;

  @override
  Widget build(BuildContext context) {
    final doctorLicense = ModalRoute.of(context)!.settings.arguments as String;
    final pairProvider = Provider.of<PairProvider>(context);
    final animalProvider = Provider.of<AnimalProvider>(context);

    final pairedFarmers = pairProvider.getFarmersForDoctor(doctorLicense);
    final animals = _selectedFarmerId != null
        ? animalProvider.getAnimalsByFarmer(_selectedFarmerId!)
        : [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
              value: _selectedFarmerId,
              items: pairedFarmers.map((farmer) {
                return DropdownMenuItem<String>(
                  value: farmer.farmerId,
                  child: Text('${farmer.name} - ${farmer.farmName}'),
                );
              }).toList(),
              hint: Text('Select Farmer'),
              onChanged: (val) => setState(() => _selectedFarmerId = val),
            ),
          ),
          Expanded(
            child: _selectedFarmerId == null
                ? Center(child: Text('Select a farmer to view their animals'))
                : animals.isEmpty
                ? Center(child: Text('No animals registered for this farmer'))
                : ListView.builder(
              itemCount: animals.length,
              itemBuilder: (context, index) => AnimalCard(animal: animals[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: _selectedFarmerId != null
          ? FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
            context,
            '/addReport',
            arguments: {
              'farmerId': _selectedFarmerId,
              'doctorLicense': doctorLicense,
            }
        ),
        tooltip: 'Add Report',
        child: Icon(Icons.note_add),
      )
          : null,
    );
  }
}