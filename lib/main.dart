import 'package:flutter/material.dart';
import 'text/selectablesubtitle.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String bottomText = '';

  void updateBottomText(String input) {
    setState(() {
      bottomText = input;
      print(input);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SelectableSubtitle(
              text:
                  '私はここで花粉を拾い、それを振りかけるこっちだ たぶんあそこにダッシュ,. それにピンチ。 見えるか? それは魔法の少し .',
              textOutputFunction: updateBottomText,
            ),
            Text(bottomText)
          ],
        ),
      ),
    );
  }
}
