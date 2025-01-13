//THIS IS WHERE THE APPS MAIN CODE IS STORED --- WELCOME!

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/settings/settingspage.dart';
import 'pages/videoplayer/videoplayerpage.dart';
import 'appstyle/colors.dart';
import 'progressprovider.dart';
import 'dictionary/operations.dart';

/*
   ____                       _____________
  / __ \____  ___  ____      / / ___/_  __/
 / / / / __ \/ _ \/ __ \__  / /\__ \ / /
/ /_/ / /_/ /  __/ / / / /_/ /___/ // /
\____/ .___/\___/_/ /_/\____//____//_/
    /_/

*/

//these look so cool i had to

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DictionaryOperations.initialize();
  runApp(ChangeNotifierProvider(
      create: (_) => ProgressProvider(), child: HomePage()));
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  static final List<Widget> homePageOptions = [
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
                icon: Icon(Icons.play_arrow), label: 'Video Player'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded), label: 'Settings')
          ],
          currentIndex: _selectedIndex,
          onTap: (value) => setState(() {
            _selectedIndex = value;
          }),
          selectedItemColor: appColors().mainAccentColor,
          backgroundColor: appColors().slightlyDarkerGrey,
          unselectedItemColor: appColors().darkGrey,
        ),
      ),
    );
  }
}
