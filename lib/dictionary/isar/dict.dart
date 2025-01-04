import 'package:isar/isar.dart';

part 'dict.g.dart';

@Collection()
class Dict{
  Id id = Isar.autoIncrement;
  String? surface;
}