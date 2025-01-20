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

  Future<void> addWord(String word,String reading,String surface, int dictionaryId) async {
    final newWord = Word()
      ..word = word
      ..reading = reading
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

  Future<dynamic> searchWords(String searchterm) async {
    final stopwatch = Stopwatch()..start();
    print('stopwatch has been started');
    final wordContaining = await isar.words.filter().wordStartsWith(searchterm).or().readingStartsWith(searchterm).surfaceProperty().findAll(); // return words that contain the search term
    print('isar filtering operation for $searchterm done in ${stopwatch.elapsedMilliseconds}ms');
    final result = await Future.wait(
      wordContaining.map((word) async{
        if(word != null){
          return jsonDecode(word);
        }
        return [];
      })
    );
    print('json decoding operation for $searchterm done in ${stopwatch.elapsedMilliseconds}ms');
    stopwatch.stop();
    print('search operation for $searchterm done in ${stopwatch.elapsedMilliseconds}ms');

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
