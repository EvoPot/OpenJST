import 'dart:convert';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:openjst/dictionary/isar/dict.dart';
import 'package:openjst/dictionary/isar/word.dart';
import 'package:path_provider/path_provider.dart';

class DictionaryOperations{
  static late Isar words;
  static late Isar dictionaries;


  //initialize ig
  static Future<void> initialize() async{
    //am i doing this correctly
    final dir = await getApplicationDocumentsDirectory();
    words = await Isar.open([WordSchema], directory: dir.path);
    dictionaries = await Isar.open([DictSchema], directory: dir.path);
  }


  //write operations

  Future<void> addDictionary(String surface) async{
    final newDict = Dict()..surface = surface;
    await dictionaries.writeTxn(() => dictionaries.dicts.put(newDict));
  }

  Future<void> addWord(String surface, int dictionaryId) async{
    final newWord = Word()..surface = surface
    ..dictionaryId = dictionaryId;
    await words.writeTxn(() => words.words.put(newWord));
  }

  // read operations

  Future<List<String>> SearchWords(String searchterm) async{

    final processing = await words.words.filter().surfaceContains(searchterm).findAll();
    List<String> result = [];

    for(Word i in processing){
      final jsonifiedString = jsonDecode(i.surface!);


      try{
        
        if(jsonifiedString[0].contains(searchterm) || jsonifiedString[1].contains(searchterm)){
          result.add(jsonDecode(i.surface!));

        }


      } catch(e){
        print(e);
      }
      
    }

    return result;

  }

  //delete operations

  Future<void> deleteDictionaryWords(int dictionaryId) async{
    final delete = await words.words.filter().dictionaryIdEqualTo(dictionaryId).findAll();

    await words.writeTxn(() async {
      for (Word word in delete) {
        await words.words.delete(word.id);
      }
    });

  }

  Future<void> deleteDictionary(int dictionaryId) async{
    await deleteDictionaryWords(dictionaryId);

    await dictionaries.writeTxn(() async{
      final delete = await dictionaries.dicts.get(dictionaryId);
      if (delete != null){
        await dictionaries.dicts.delete(delete.id);
      }
    });
  }
  }
