import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationScreen extends StatelessWidget {
  InformationScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> resources = [
    {
      'title': 'What if your cow is feeling sick?',
      'url': 'https://example.com/cow-sick',
    },
    {
      'title': 'What if your animal is sluggish?',
      'url': 'https://example.com/animal-sluggish',
    },
    {
      'title': 'Basic animal care guidelines',
      'url': 'https://example.com/animal-care',
    },
    {
      'title': 'Vaccination schedule for livestock',
      'url': 'https://example.com/vaccination',
    },
    {
      'title': 'Common diseases and treatments',
      'url': 'https://example.com/diseases',
    },
  ];

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Information Resources')),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          final resource = resources[index];
          return ListTile(
            leading: Icon(Icons.video_library, color: Colors.green),
            title: Text(resource['title']!),
            onTap: () => _launchURL(resource['url']!),
          );
        },
      ),
    );
  }
}