import 'package:flutter/material.dart';
import 'package:openjst/main/dictionary/operationbuttons/managedictionaries/dictionaryoperationbutton.dart';
import 'package:openjst/main/dictionary/operationbuttons/managedictionaries/managedictionaries.dart';
import 'package:openjst/main/dictionary/operations.dart';
import 'package:provider/provider.dart';
import '../../isar/word.dart';

class DictionaryProvider extends ChangeNotifier{
  List<Widget> dictionaryButtonList = [Text('there are no dictionaries. try adding one!')];

  void updateButtonList() async{
    List<Dict> dictionaryResultList = await DictionaryOperations().getAllDictionaries();
    dictionaryButtonList = List.generate(
      dictionaryResultList.length,
      (int index){
        return DictionaryOperationButton(dictionaryManaged: dictionaryResultList[index]);
      }
      );
    if(dictionaryButtonList.isEmpty) dictionaryButtonList.add(Text('there are no dictionaries. try adding one!'));
    notifyListeners();
  }

}