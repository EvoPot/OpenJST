import 'package:flutter/material.dart';
import 'package:openjst/main/dictionary/isar/word.dart';
import '../../operations.dart';
import 'dictionaryoperationbutton.dart';
import '../../../appstyle/colors.dart';


class ManageDictionariesButton extends StatefulWidget {
  final String text;
  ManageDictionariesButton({super.key, required this.text});

  @override
  State<ManageDictionariesButton> createState() => _ManageDictionariesButtonState();
}

class _ManageDictionariesButtonState extends State<ManageDictionariesButton> {
  DictionaryOperations operations = DictionaryOperations();
  List<Widget> dictionaryButtonList = [];

  appColors colors = appColors();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateButtonList();
  }

  void UpdateButtonList() async{
    List<Dict> result = await operations.getAllDictionaries();
    print('result length is ${result.length}');
    dictionaryButtonList = List.generate(
      result.length, 
      (int index){
        return DictionaryOperationButton(dictionaryManaged: result[index], onButtonPress: deleteDictionary);
      }
      );

  }


  Future<void> deleteDictionary(int dictionary) async{
    await operations.deleteDictionary(dictionary);
    UpdateButtonList();
  }

  void openManageDictionariesButton(BuildContext context) async {
    UpdateButtonList();

    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
            title: const Text('Manage Dictionaries...'),
            content: 
                Column(children: dictionaryButtonList , mainAxisSize: MainAxisSize.min)        
          );
        
      }
      );

  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => openManageDictionariesButton(context),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colors.slightlyDarkerGrey),
          foregroundColor: WidgetStateProperty.all(colors.mainAccentColor),
        ),
				
        child: Text(widget.text),
				);
  }
}
