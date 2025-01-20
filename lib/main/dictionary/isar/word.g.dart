// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWordCollection on Isar {
  IsarCollection<Word> get words => this.collection();
}

const WordSchema = CollectionSchema(
  name: r'Word',
  id: 2997905348638732671,
  properties: {
    r'dictionaryId': PropertySchema(
      id: 0,
      name: r'dictionaryId',
      type: IsarType.long,
    ),
    r'reading': PropertySchema(
      id: 1,
      name: r'reading',
      type: IsarType.string,
    ),
    r'surface': PropertySchema(
      id: 2,
      name: r'surface',
      type: IsarType.string,
    ),
    r'word': PropertySchema(
      id: 3,
      name: r'word',
      type: IsarType.string,
    )
  },
  estimateSize: _wordEstimateSize,
  serialize: _wordSerialize,
  deserialize: _wordDeserialize,
  deserializeProp: _wordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _wordGetId,
  getLinks: _wordGetLinks,
  attach: _wordAttach,
  version: '3.1.0+1',
);

int _wordEstimateSize(
  Word object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.reading;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.surface;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.word;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _wordSerialize(
  Word object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dictionaryId);
  writer.writeString(offsets[1], object.reading);
  writer.writeString(offsets[2], object.surface);
  writer.writeString(offsets[3], object.word);
}

Word _wordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Word();
  object.dictionaryId = reader.readLongOrNull(offsets[0]);
  object.id = id;
  object.reading = reader.readStringOrNull(offsets[1]);
  object.surface = reader.readStringOrNull(offsets[2]);
  object.word = reader.readStringOrNull(offsets[3]);
  return object;
}

P _wordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _wordGetId(Word object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wordGetLinks(Word object) {
  return [];
}

void _wordAttach(IsarCollection<dynamic> col, Id id, Word object) {
  object.id = id;
}

extension WordQueryWhereSort on QueryBuilder<Word, Word, QWhere> {
  QueryBuilder<Word, Word, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WordQueryWhere on QueryBuilder<Word, Word, QWhereClause> {
  QueryBuilder<Word, Word, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WordQueryFilter on QueryBuilder<Word, Word, QFilterCondition> {
  QueryBuilder<Word, Word, QAfterFilterCondition> dictionaryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dictionaryId',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> dictionaryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dictionaryId',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> dictionaryIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dictionaryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> dictionaryIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dictionaryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> dictionaryIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dictionaryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> dictionaryIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dictionaryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reading',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reading',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reading',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reading',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reading',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> readingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reading',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surface',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surface',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surface',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surface',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surface',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> surfaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surface',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'word',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'word',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'word',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'word',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'word',
        value: '',
      ));
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> wordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'word',
        value: '',
      ));
    });
  }
}

extension WordQueryObject on QueryBuilder<Word, Word, QFilterCondition> {}

extension WordQueryLinks on QueryBuilder<Word, Word, QFilterCondition> {}

extension WordQuerySortBy on QueryBuilder<Word, Word, QSortBy> {
  QueryBuilder<Word, Word, QAfterSortBy> sortByDictionaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dictionaryId', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByDictionaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dictionaryId', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByReadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortBySurface() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortBySurfaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.desc);
    });
  }
}

extension WordQuerySortThenBy on QueryBuilder<Word, Word, QSortThenBy> {
  QueryBuilder<Word, Word, QAfterSortBy> thenByDictionaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dictionaryId', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByDictionaryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dictionaryId', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByReadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenBySurface() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenBySurfaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.desc);
    });
  }
}

extension WordQueryWhereDistinct on QueryBuilder<Word, Word, QDistinct> {
  QueryBuilder<Word, Word, QDistinct> distinctByDictionaryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dictionaryId');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByReading(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reading', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctBySurface(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surface', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByWord(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'word', caseSensitive: caseSensitive);
    });
  }
}

extension WordQueryProperty on QueryBuilder<Word, Word, QQueryProperty> {
  QueryBuilder<Word, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Word, int?, QQueryOperations> dictionaryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dictionaryId');
    });
  }

  QueryBuilder<Word, String?, QQueryOperations> readingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reading');
    });
  }

  QueryBuilder<Word, String?, QQueryOperations> surfaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surface');
    });
  }

  QueryBuilder<Word, String?, QQueryOperations> wordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'word');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDictCollection on Isar {
  IsarCollection<Dict> get dicts => this.collection();
}

const DictSchema = CollectionSchema(
  name: r'Dict',
  id: 987444509729091105,
  properties: {
    r'surface': PropertySchema(
      id: 0,
      name: r'surface',
      type: IsarType.string,
    )
  },
  estimateSize: _dictEstimateSize,
  serialize: _dictSerialize,
  deserialize: _dictDeserialize,
  deserializeProp: _dictDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dictGetId,
  getLinks: _dictGetLinks,
  attach: _dictAttach,
  version: '3.1.0+1',
);

int _dictEstimateSize(
  Dict object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.surface;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dictSerialize(
  Dict object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.surface);
}

Dict _dictDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Dict();
  object.id = id;
  object.surface = reader.readStringOrNull(offsets[0]);
  return object;
}

P _dictDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dictGetId(Dict object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dictGetLinks(Dict object) {
  return [];
}

void _dictAttach(IsarCollection<dynamic> col, Id id, Dict object) {
  object.id = id;
}

extension DictQueryWhereSort on QueryBuilder<Dict, Dict, QWhere> {
  QueryBuilder<Dict, Dict, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DictQueryWhere on QueryBuilder<Dict, Dict, QWhereClause> {
  QueryBuilder<Dict, Dict, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Dict, Dict, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Dict, Dict, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Dict, Dict, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DictQueryFilter on QueryBuilder<Dict, Dict, QFilterCondition> {
  QueryBuilder<Dict, Dict, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surface',
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surface',
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surface',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surface',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surface',
        value: '',
      ));
    });
  }

  QueryBuilder<Dict, Dict, QAfterFilterCondition> surfaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surface',
        value: '',
      ));
    });
  }
}

extension DictQueryObject on QueryBuilder<Dict, Dict, QFilterCondition> {}

extension DictQueryLinks on QueryBuilder<Dict, Dict, QFilterCondition> {}

extension DictQuerySortBy on QueryBuilder<Dict, Dict, QSortBy> {
  QueryBuilder<Dict, Dict, QAfterSortBy> sortBySurface() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.asc);
    });
  }

  QueryBuilder<Dict, Dict, QAfterSortBy> sortBySurfaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.desc);
    });
  }
}

extension DictQuerySortThenBy on QueryBuilder<Dict, Dict, QSortThenBy> {
  QueryBuilder<Dict, Dict, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Dict, Dict, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Dict, Dict, QAfterSortBy> thenBySurface() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.asc);
    });
  }

  QueryBuilder<Dict, Dict, QAfterSortBy> thenBySurfaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.desc);
    });
  }
}

extension DictQueryWhereDistinct on QueryBuilder<Dict, Dict, QDistinct> {
  QueryBuilder<Dict, Dict, QDistinct> distinctBySurface(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surface', caseSensitive: caseSensitive);
    });
  }
}

extension DictQueryProperty on QueryBuilder<Dict, Dict, QQueryProperty> {
  QueryBuilder<Dict, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Dict, String?, QQueryOperations> surfaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surface');
    });
  }
}
