import 'package:isar/isar.dart';


part 'word.g.dart';

@Collection()
class Word{
  Id id = Isar.autoIncrement;

  String? term; //The word itself

  late String surfaces; // The JSON that contains the stuff like the word structure

  int? dictionaryId;

}

@Collection()
class Dict{
  Id id = Isar.autoIncrement;
  String? surface;
  String? path;
}