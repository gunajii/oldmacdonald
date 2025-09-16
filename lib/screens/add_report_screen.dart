import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/animal_provider.dart';
import '../services/calculation_service.dart';

class AddReportScreen extends StatefulWidget {
  @override
  _AddReportScreenState createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedAnimalId;
  String _drugName = '';
  String _drugId = '';
  String _reason = '';
  String _doctorName = '';
  String _notes = '';
  DateTime _dateAdministered = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final farmerId = args['farmerId'] as String;
    final doctorLicense = args['doctorLicense'] as String;

    final animalProvider = Provider.of<AnimalProvider>(context);
    final animals = animalProvider.getAnimalsByFarmer(farmerId);

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
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                onSaved: (val) => _drugName = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Drug ID'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                onSaved: (val) => _drugId = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Reason'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
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

                      // Here you would typically create and save a Report object
                      // with all the collected data (_drugName, _drugId, _reason, etc.)

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Report submitted successfully')),
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