import 'package:flutter/material.dart';
import 'package:openjst/main/dictionary/operationbuttons/adddictionary.dart';
import 'pages/dictionarypage.dart';
import 'pages/stylepage.dart';
import '../../appstyle/colors.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  static final List<Widget> pages = [DictionaryPage(), StylePage()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: appColors().darkGrey,
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: appColors().slightlyDarkerGrey,
            title: Text('Settings'),
            bottom: TabBar(
                labelColor: appColors().secondaryAccentColor,
                indicatorColor: appColors().secondaryAccentColor,
                tabs: [
                  Tab(
                    text: 'Dictionaries',
                    icon: Icon(Icons.menu_book),
                  ),
                  Tab(text: 'style', icon: Icon(Icons.palette))
                ]),
          ),
          body: TabBarView(children: pages),
        ));
    ;
  }
}
