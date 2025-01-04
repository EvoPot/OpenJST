import 'package:isar/isar.dart';


part 'word.g.dart';

@Collection()
class Word{
  Id id = Isar.autoIncrement;

  String? surface;

  int? dictionaryId;

}

@Collection()
class Dict{
  Id id = Isar.autoIncrement;
  String? surface;
}