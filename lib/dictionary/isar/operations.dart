import 'dart:convert';
import 'dart:io';


import 'package:isar/isar.dart';
import 'package:openjst/dictionary/isar/word.dart';
import 'package:path_provider/path_provider.dart';

class DictionaryOperations{
  static late Isar isar;


  //initialize ig
  static Future<void> initialize() async{
    //am i doing this correctly
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([WordSchema,DictSchema], directory: dir.path);
  }


  //write operations

  Future<int> addDictionary(String surface) async{
    final newDict = Dict()..surface = surface;
    await isar.writeTxn(() => isar.dicts.put(newDict));
    return newDict.id;
  }

  Future<void> addWord(String surface, int dictionaryId) async{
    final newWord = Word()..surface = surface
    ..dictionaryId = dictionaryId;
    await isar.writeTxn(() => isar.words.put(newWord));
  }

  // read operations

  Future<List<String>> searchWords(String searchterm) async{

    final processing = await isar.words.filter().surfaceContains(searchterm).findAll();
    List<String> result = [];

    for(Word i in processing){
      final jsonifiedString = jsonDecode(i.surface!);


      try{
        
        if(jsonifiedString[0].contains(searchterm) || jsonifiedString[1].contains(searchterm)){
          result.add(jsonifiedString);

        }


      } catch(e){
        print(e);
      }
      
    }

    return result;

  }

  //delete operations

  Future<void> deleteDictionaryWords(int dictionaryId) async{
    final delete = await isar.words.filter().dictionaryIdEqualTo(dictionaryId).findAll();

    await isar.writeTxn(() async {
      for (Word word in delete) {
        await isar.words.delete(word.id);
      }
    });

  }

  Future<void> deleteDictionary(int dictionaryId) async{
    await deleteDictionaryWords(dictionaryId);

    await isar.writeTxn(() async{
      final delete = await isar.dicts.get(dictionaryId);
      if (delete != null){
        await isar.dicts.delete(delete.id);
      }
    });
  }
  }
