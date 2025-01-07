//THIS IS WHERE THE APPS MAIN CODE IS STORED --- WELCOME!

import 'package:flutter/material.dart';
import 'pages/settingspage.dart';
import 'pages/videoplayerpage.dart';
import 'package:openjst/dictionary/dictionarytest.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  int _selectedIndex = 0;
  static const List<Widget> homePageOptions = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Placeholder(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.video_file_rounded), label: 'Video Player'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded), label: 'Settings')
          ],
          currentIndex: _selectedIndex,
          onTap: (value) => _selectedIndex = value,
          selectedItemColor: Colors.amber,
        ),
      ),
    );
  }
}
