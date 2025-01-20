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

  Future<int> addDictionary(String surface) async {
    final newDict = Dict()..surface = surface;
    await isar.writeTxn(() => isar.dicts.put(newDict));
    return newDict.id;
  }

  Future<void> addWord(String surface, int dictionaryId) async {
    final newWord = Word()
      ..surface = surface
      ..dictionaryId = dictionaryId;
    await isar.writeTxn(() => isar.words.put(newWord));
  }

  // read operations
  Future<List<int>> getAllDictionaries() async{
    final processing = await isar.dicts.where().findAll();

    List<int> result = [];

    for(Dict i in processing){
      result.add(i.id);

    }

    return result;
  }

  Future<List<List<dynamic>>> searchWords(String searchterm) async {
    final wordContaining = await isar.words.filter().wordContains(searchterm).findAll(); // return words that contain the search term

    final readingContaining = await isar.words.filter().readingContains(searchterm).findAll(); // return readings that contain the search term

    final mergerList = (wordContaining + readingContaining).toSet().toList(); //merge the two lists, delete duplicate words

    List<List<dynamic>> result = [];

    for(Word i in mergerList){
      final jsonifiedString = jsonDecode(i.surface!); //The surface is JSON stored as string owo
      result.add(jsonifiedString);
    }

    return result;
  }

  Future<List<String>> getAllSurfaces() async {
    // Retrieve all the Word objects from the Isar database
    final words = await isar.words.where().findAll();

    // Extract the surface property and return a list
    List<String> surfaces = [];

    for (var word in words) {
      if (word.surface != null) {
        surfaces.add(word.surface!); // Ensure `surface` is not null
      }
    }

    return surfaces;
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
