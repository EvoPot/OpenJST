import 'dart:convert';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:openjst/dictionary/isar/word.dart';
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

  Future<List<List<dynamic>>> searchWords(String searchterm) async {
    final processing =
        await isar.words.filter().surfaceContains(searchterm).findAll();

    List<List<dynamic>> result = [];

    for (Word i in processing) {
      final jsonifiedString = jsonDecode(i.surface!);

      try {
        if (jsonifiedString[0].contains(searchterm) ||
            jsonifiedString[1].contains(searchterm)) {
          result.add(jsonifiedString);
        }
      } catch (e) {
        print(jsonEncode(i.surface!));
        print(e);
      }
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

  Future<void> deleteAll() async {
    await isar.writeTxn(() async {
    await isar.words.clear();
    await isar.dicts.clear();
  });
}







}
