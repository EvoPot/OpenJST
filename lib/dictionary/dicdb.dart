import 'package:isar/isar.dart';

part 'dicdb.g.dart';

@Collection()
class Word {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? term;

  String? reading;

  List<String>? definitions;

  int? wordId;

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

@Collection()
class Dictionary {
  Id id = Isar.autoIncrement;

  String? name;

  String? directory;
}
