import 'package:isar/isar.dart';


part 'word.g.dart';

@Collection()
class Word{
  Id id = Isar.autoIncrement;

  String? word; //The word itself

  String? reading; //The hiragana reading of the word

  String? surface; // The JSON that contains the stuff like the word structure

  int? dictionaryId;

}

@Collection()
class Dict{
  Id id = Isar.autoIncrement;
  String? surface;
}