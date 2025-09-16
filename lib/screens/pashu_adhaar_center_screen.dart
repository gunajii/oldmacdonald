import 'package:flutter/material.dart';

class PashuAdhaarCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pashu Adhaar Centers')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map, size: 100, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'Pashu Adhaar Center Map',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Map integration will be implemented here',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // This would open maps with directions in a real app
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Map functionality will be added later')),
                );
              },
              child: Text('Find Nearest Center'),
            ),
          ],
        ),
      ),
    );
  }
}