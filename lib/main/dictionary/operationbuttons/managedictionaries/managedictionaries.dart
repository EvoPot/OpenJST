import 'package:flutter/material.dart';
import 'package:openjst/main/dictionary/operationbuttons/managedictionaries/managedictionariesprovider.dart';
import 'package:provider/provider.dart';
import '../../operations.dart';
import 'dictionaryoperationbutton.dart';
import '../../../appstyle/colors.dart';


class ManageDictionariesButton extends StatelessWidget {
  final String text;
  ManageDictionariesButton({super.key, required this.text});

  DictionaryOperations operations = DictionaryOperations();
  appColors colors = appColors();

  void openManageDictionariesButton(BuildContext context) async {

    await DictionaryProvider().updateButtonList;

    showDialog(
      context: context,
      builder: (context){
        return ChangeNotifierProvider(
          create: (context) => DictionaryProvider(),
          child: AlertDialog(
            title: Text('Manage Dictionaries...'),
            content: 
            Consumer<DictionaryProvider>(
              builder: (context,value,child){
                return Column(children: value.dictionaryButtonList , mainAxisSize: MainAxisSize.min);
                
              }
              )
            
            
            
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