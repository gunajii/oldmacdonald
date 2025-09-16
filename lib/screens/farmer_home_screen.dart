import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/animal_provider.dart';
import '../providers/pair_provider.dart';
import '../widgets/animal_card.dart';
import 'pashu_adhaar_center_screen.dart';
import 'information_screen.dart';

class FarmerHomeScreen extends StatefulWidget {
  @override
  _FarmerHomeScreenState createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<FarmerHomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final farmerId = ModalRoute.of(context)!.settings.arguments as String;
    final pairProvider = Provider.of<PairProvider>(context);
    final animalProvider = Provider.of<AnimalProvider>(context);

    final farmer = pairProvider.getFarmerById(farmerId);
    final animals = animalProvider.getAnimalsByFarmer(farmerId);

    Widget _getCurrentScreen() {
      switch (_selectedIndex) {
        case 0:
          return animals.isEmpty
              ? Center(child: Text('No animals registered'))
              : ListView.builder(
            itemCount: animals.length,
            itemBuilder: (context, index) => AnimalCard(animal: animals[index]),
          );
        case 1:
          return PashuAdhaarCenterScreen();
        case 2:
          return InformationScreen();
        default:
          return Container();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(
              context,
              '/farmerProfile',
              arguments: farmerId,
            ),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
      body: _getCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Pashu Adhaar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
        heroTag: 'registerAnimal',
        onPressed: () => Navigator.pushNamed(
          context,
          '/registerAnimal',
          arguments: farmerId,
        ),
        child: Icon(Icons.pets),
        tooltip: 'Register Animal',
      )
          : null,
    );
  }
}