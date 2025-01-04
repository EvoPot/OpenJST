import "package:isar/isar.dart";
import "package:path_provider/path_provider.dart";
import "dicdb.dart";

class dictionaryDatabase {
  static late Isar isar;
  //initialize ig

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([WordSchema], directory: dir.path);
  }

  

  Future<void> addWord(
      Isar isar, String term, String reading, List<String> definitions) async {
    final word = Word()
      ..term = term
      ..reading = reading
      ..definitions = definitions;

    await isar.writeTxn(() async {
      await isar.words.put(word);
    });
  }

  Future<List<Word>> searchWordByString(Isar isar, String searchterm) async {
    final result = await isar.words.filter().termContains(searchterm).findAll();
    return result;
  }
}
