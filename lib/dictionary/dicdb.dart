import 'package:isar/isar.dart';

part 'dicdb.g.dart';

@Collection()
class Word {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? term;

  String? reading;

  List<String>? definitions;

  int? wordId;
}

@Collection()
class Dictionary {
  Id id = Isar.autoIncrement;

  String? name;

  String? directory;
}
