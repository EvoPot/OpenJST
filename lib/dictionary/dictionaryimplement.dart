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

  Future<void> addword(String word, String reading, String) async {}
}
