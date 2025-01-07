import 'package:flutter/material.dart';
import 'package:openjst/dictionary/adddictionary.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
            bottom: TabBar(
                labelColor: Colors.cyan,
                indicatorColor: Colors.cyan,
                tabs: [
                  Tab(
                    text: 'Dictionaries',
                    icon: Icon(Icons.menu_book),
                  ),
                  Tab(text: 'style', icon: Icon(Icons.palette))
                ]),
          ),
        ));
    ;
  }
}
