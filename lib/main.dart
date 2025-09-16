import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/animal_provider.dart';
import 'providers/pair_provider.dart';
import 'providers/auth_provider.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/farmer_home_screen.dart';
import 'screens/doctor_home_screen.dart';
import 'screens/add_report_screen.dart';
import 'screens/register_animal_screen.dart';
import 'screens/farmer_profile_screen.dart';
import 'screens/pashu_adhaar_center_screen.dart';
import 'screens/information_screen.dart';

void main() {
  runApp(DigitalFarmApp());
}

class DigitalFarmApp extends StatelessWidget {
  const DigitalFarmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnimalProvider()),
        ChangeNotifierProvider(create: (_) => PairProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Farm',
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/farmerHome': (context) => FarmerHomeScreen(),
          '/doctorHome': (context) => DoctorHomeScreen(),
          '/addReport': (context) => AddReportScreen(),
          '/registerAnimal': (context) => RegisterAnimalScreen(),
          '/farmerProfile': (context) => FarmerProfileScreen(),
          '/pashuAdhaar': (context) => PashuAdhaarCenterScreen(),
          '/information': (context) => InformationScreen(),
        },
      ),
    );
  }
}