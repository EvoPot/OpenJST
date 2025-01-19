import 'package:flutter/material.dart';
import '../../operations.dart';
import 'dictionaryoperationbutton.dart';
import '../../../appstyle/colors.dart';

class ManageDictionariesButton extends StatelessWidget {
  final String text;
  ManageDictionariesButton({super.key, required this.text});

  DictionaryOperations operations = DictionaryOperations();
  appColors colors = appColors();

  void openManageDictionariesButton(BuildContext context) async {
    List<int> listOfDicts = await DictionaryOperations().getAllDictionaries();

    List<Widget> dictionaryButtonList = List.generate(
      listOfDicts.length,
      (int i){
        return DictionaryOperationButton(dictionaryManaged: listOfDicts[i],);
      }
      );

    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Manage Dictionaries...'),
          content: Scaffold(
            body: Column(children: dictionaryButtonList,),
          ),
          
        );
      }
      );

  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => openManageDictionariesButton(context),
        child: Text(text),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colors.slightlyDarkerGrey),
          foregroundColor: WidgetStateProperty.all(colors.mainAccentColor),
        ));
  }
}