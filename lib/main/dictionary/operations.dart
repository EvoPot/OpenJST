import 'dart:convert';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:openjst/main/dictionary/isar/word.dart';
import 'package:path_provider/path_provider.dart';

class DictionaryOperations {
  static late Isar isar;

  //initialize ig
  static Future<void> initialize() async {
    //am i doing this correctly
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([WordSchema, DictSchema], directory: dir.path);
  }

  //write operations

  Future<int> addNewDictionary() async {
    final newDict = Dict();
    await isar.writeTxn(() => isar.dicts.put(newDict));
    return newDict.id;
  }

  Future<void> updateDictionary(int id, String surface, String path) async{
    final updatedDict = await isar.dicts.get(id);

    if(updatedDict == null) return;

    updatedDict.path = path;
    updatedDict.surface = surface;

    await isar.writeTxn(() async {
      await isar.dicts.put(updatedDict);   
    });

    return;
    
  }

  Future<int> initializeNewWord(String term) async{
    final newWord = Word()..term = term;
    await isar.writeTxn(() => isar.words.put(newWord));
    return newWord.id;
  }


  Future<void> addWord(String word, List<String> surfaces, int dictionaryId) async {
    final newWord = Word()
      ..term = word
      ..surfaces = jsonEncode(surfaces)
      ..dictionaryId = dictionaryId;
    await isar.writeTxn(() => isar.words.put(newWord));
    return;
  }

  // read operations
  Future<List<Dict>> getAllDictionaries() async{
    final result = await isar.dicts.where().findAll();

    return result;
  }

  Future<List<Word>> searchWords(String searchterm) async {
    final stopwatch = Stopwatch()..start();
    print('stopwatch has been started');
    final wordContaining = await isar.words.filter().termStartsWith(searchterm).findAll(); // return words that contain the search term
    print('isar filtering operation for $searchterm done in ${stopwatch.elapsedMilliseconds}ms');
    stopwatch.stop();
    return wordContaining;
  }

  
  //delete operations

  Future<void> deleteDictionaryWords(int dictionaryId) async {
    final delete =
        await isar.words.filter().dictionaryIdEqualTo(dictionaryId).findAll();

    await isar.writeTxn(() async {
      for (Word word in delete) {
        await isar.words.delete(word.id);
      }
    });
  }

  Future<void> deleteDictionary(int dictionaryId) async {
    await deleteDictionaryWords(dictionaryId);

    await isar.writeTxn(() async {
      final delete = await isar.dicts.get(dictionaryId);
      if (delete != null) {
        await isar.dicts.delete(delete.id);
      }
    });
  }

  Future<void> resetAll() async {
    await isar.writeTxn(() async {
      // Delete all words
      await isar.words.clear();

      // Delete all dictionaries
      await isar.dicts.clear();
    });
  }
}
