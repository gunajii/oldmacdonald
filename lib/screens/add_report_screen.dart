import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/animal_provider.dart';
import '../models/animal.dart';
import '../services/calculation_service.dart';

class AddReportScreen extends StatefulWidget {
  @override
  _AddReportScreenState createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedAnimalId;
  String _drugName = '';
  String _reason = '';
  String _doctorName = '';
  String _notes = '';
  DateTime _dateAdministered = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final animalProvider = Provider.of<AnimalProvider>(context);
    final animals = animalProvider.animals;

    return Scaffold(
      appBar: AppBar(title: Text('Add Report')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedAnimalId,
                items: animals.map((animal) {
                  return DropdownMenuItem<String>(
                    value: animal.animalId,
                    child: Text(animal.animalId),
                  );
                }).toList(),
                hint: Text('Select Animal ID'),
                onChanged: (val) => setState(() => _selectedAnimalId = val),
                validator: (val) => val == null ? 'Please select an animal' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Drug/Medicine Name'),
                onSaved: (val) => _drugName = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Reason'),
                onSaved: (val) => _reason = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Doctor Name'),
                onSaved: (val) => _doctorName = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Notes/Extra Info'),
                onSaved: (val) => _notes = val ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    if (_selectedAnimalId != null) {
                      final withdrawalDates = CalculationService.calculateWithdrawalDates(_dateAdministered);
                      animalProvider.updateAnimalStatus(
                        _selectedAnimalId!,
                        withdrawalDates['meat']!,
                        withdrawalDates['dairy']!,
                      );
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}