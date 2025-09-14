import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/animal_provider.dart';
import '../models/animal.dart';

class RegisterAnimalScreen extends StatefulWidget {
  @override
  _RegisterAnimalScreenState createState() => _RegisterAnimalScreenState();
}

class _RegisterAnimalScreenState extends State<RegisterAnimalScreen> {
  final _formKey = GlobalKey<FormState>();
  String _id = '';
  String _breed = '';
  String _type = '';
  String? _dobIso;
  String? _sex;
  String? _notes;

  @override
  Widget build(BuildContext context) {
    final animalProvider = Provider.of<AnimalProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Register New Animal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Animal ID'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                onSaved: (val) => _id = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Breed'),
                onSaved: (val) => _breed = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Type'),
                onSaved: (val) => _type = val ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final animal = Animal(
                      animalId: _id,
                      breed: _breed,
                      type: _type,
                      dobIso: _dobIso,
                      sex: _sex,
                      notes: _notes,
                    );
                    animalProvider.addAnimal(animal);
                    Navigator.pop(context);
                  }
                },
                child: Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}