import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/animal_provider.dart';
import 'screens/login_screen.dart';
import 'screens/farmer_home_screen.dart';
import 'screens/doctor_home_screen.dart';
import 'screens/add_report_screen.dart';
import 'screens/register_animal_screen.dart';

void main() {
  runApp(DigitalFarmApp());
}

class DigitalFarmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AnimalProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Farm',
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/farmerHome': (context) => FarmerHomeScreen(),
          '/doctorHome': (context) => DoctorHomeScreen(),
          '/addReport': (context) => AddReportScreen(),
          '/registerAnimal': (context) => RegisterAnimalScreen(),
        },
      ),
    );
  }
}