import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pair_provider.dart';
import '../models/farmer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _farmerId = '';
  String _name = '';
  String _farmName = '';
  String _contact = '';
  String _email = '';
  String _dateOfBirth = '';
  String _farmLocation = '';

  @override
  Widget build(BuildContext context) {
    final pairProvider = Provider.of<PairProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Farmer Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Farmer ID'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                onSaved: (val) => _farmerId = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                onSaved: (val) => _name = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Farm Name'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                onSaved: (val) => _farmName = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile Number'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                onSaved: (val) => _contact = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email ID'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                onSaved: (val) => _email = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date of Birth (YYYY-MM-DD)'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                onSaved: (val) => _dateOfBirth = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Farm Location'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                onSaved: (val) => _farmLocation = val ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final farmer = Farmer(
                      farmerId: _farmerId,
                      name: _name,
                      farmName: _farmName,
                      contact: _contact,
                      email: _email,
                      dateOfBirth: _dateOfBirth,
                      farmLocation: _farmLocation,
                    );
                    pairProvider.addFarmer(farmer);
                    Navigator.pop(context);
                  }
                },
                child: Text('Sign Up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}