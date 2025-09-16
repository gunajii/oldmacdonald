import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _farmerFormKey = GlobalKey<FormState>();
  final _doctorFormKey = GlobalKey<FormState>();
  String _farmerId = '';
  String _doctorLicense = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Digital Farm Login'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Farmer'),
              Tab(text: 'Doctor'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Farmer Login
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Form(
                    key: _farmerFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Farmer ID'),
                          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                          onSaved: (val) => _farmerId = val ?? '',
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_farmerFormKey.currentState!.validate()) {
                              _farmerFormKey.currentState!.save();
                              Navigator.pushReplacementNamed(context, '/farmerHome', arguments: _farmerId);
                            }
                          },
                          child: Text('Login as Farmer'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/signup'),
                    child: Text('Don\'t have an account? Sign Up'),
                  ),
                ],
              ),
            ),
            // Doctor Login
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _doctorFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Doctor License Number'),
                      validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      onSaved: (val) => _doctorLicense = val ?? '',
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_doctorFormKey.currentState!.validate()) {
                          _doctorFormKey.currentState!.save();
                          Navigator.pushReplacementNamed(context, '/doctorHome', arguments: _doctorLicense);
                        }
                      },
                      child: Text('Login as Doctor'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}