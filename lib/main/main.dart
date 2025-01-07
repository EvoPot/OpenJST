//THIS IS WHERE THE APPS MAIN CODE IS STORED --- WELCOME!

import 'package:flutter/material.dart';
import 'pages/settings/settingspage.dart';
import 'pages/videoplayer/videoplayerpage.dart';
import 'package:openjst/dictionary/dictionarytest.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  static const List<Widget> homePageOptions = [
    Videoplayerpage(),
    SettingsPage()
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage.homePageOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.video_file_rounded), label: 'Video Player'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded), label: 'Settings')
          ],
          currentIndex: _selectedIndex,
          onTap: (value) => setState(() {
            _selectedIndex = value;
          }),
          selectedItemColor: Colors.amber,
        ),
      ),
    );
  }
}
