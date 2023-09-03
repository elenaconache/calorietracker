// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_diary_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalDiaryEntryCollection on Isar {
  IsarCollection<LocalDiaryEntry> get localDiaryEntrys => this.collection();
}

const LocalDiaryEntrySchema = CollectionSchema(
  name: r'LocalDiaryEntry',
  id: -6377377715649131462,
  properties: {
    r'deleted': PropertySchema(
      id: 0,
      name: r'deleted',
      type: IsarType.bool,
    ),
    r'entryDate': PropertySchema(
      id: 1,
      name: r'entryDate',
      type: IsarType.string,
    ),
    r'foodId': PropertySchema(
      id: 2,
      name: r'foodId',
      type: IsarType.string,
    ),
    r'localFoodId': PropertySchema(
      id: 3,
      name: r'localFoodId',
      type: IsarType.long,
    ),
    r'meal': PropertySchema(
      id: 4,
      name: r'meal',
      type: IsarType.byte,
      enumMap: _LocalDiaryEntrymealEnumValueMap,
    ),
    r'pushed': PropertySchema(
      id: 5,
      name: r'pushed',
      type: IsarType.bool,
    ),
    r'servingQuantity': PropertySchema(
      id: 6,
      name: r'servingQuantity',
      type: IsarType.long,
    ),
    r'unitId': PropertySchema(
      id: 7,
      name: r'unitId',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 8,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _localDiaryEntryEstimateSize,
  serialize: _localDiaryEntrySerialize,
  deserialize: _localDiaryEntryDeserialize,
  deserializeProp: _localDiaryEntryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _localDiaryEntryGetId,
  getLinks: _localDiaryEntryGetLinks,
  attach: _localDiaryEntryAttach,
  version: '3.1.0+1',
);

int _localDiaryEntryEstimateSize(
  LocalDiaryEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.entryDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.foodId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.unitId.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _localDiaryEntrySerialize(
  LocalDiaryEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.deleted);
  writer.writeString(offsets[1], object.entryDate);
  writer.writeString(offsets[2], object.foodId);
  writer.writeLong(offsets[3], object.localFoodId);
  writer.writeByte(offsets[4], object.meal.index);
  writer.writeBool(offsets[5], object.pushed);
  writer.writeLong(offsets[6], object.servingQuantity);
  writer.writeString(offsets[7], object.unitId);
  writer.writeString(offsets[8], object.userId);
}

LocalDiaryEntry _localDiaryEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalDiaryEntry();
  object.deleted = reader.readBool(offsets[0]);
  object.entryDate = reader.readStringOrNull(offsets[1]);
  object.foodId = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.localFoodId = reader.readLongOrNull(offsets[3]);
  object.meal =
      _LocalDiaryEntrymealValueEnumMap[reader.readByteOrNull(offsets[4])] ??
          Meal.breakfast;
  object.pushed = reader.readBool(offsets[5]);
  object.servingQuantity = reader.readLong(offsets[6]);
  object.unitId = reader.readString(offsets[7]);
  object.userId = reader.readString(offsets[8]);
  return object;
}

P _localDiaryEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (_LocalDiaryEntrymealValueEnumMap[reader.readByteOrNull(offset)] ??
          Meal.breakfast) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LocalDiaryEntrymealEnumValueMap = {
  'breakfast': 0,
  'lunch': 1,
  'dinner': 2,
  'snacks': 3,
};
const _LocalDiaryEntrymealValueEnumMap = {
  0: Meal.breakfast,
  1: Meal.lunch,
  2: Meal.dinner,
  3: Meal.snacks,
};

Id _localDiaryEntryGetId(LocalDiaryEntry object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _localDiaryEntryGetLinks(LocalDiaryEntry object) {
  return [];
}

void _localDiaryEntryAttach(
    IsarCollection<dynamic> col, Id id, LocalDiaryEntry object) {
  object.id = id;
}

extension LocalDiaryEntryQueryWhereSort
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QWhere> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalDiaryEntryQueryWhere
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QWhereClause> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhereClause> idBetween(
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

extension LocalDiaryEntryQueryFilter
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QFilterCondition> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      deletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deleted',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'entryDate',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'entryDate',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entryDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryDate',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entryDate',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'foodId',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'foodId',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foodId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foodId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
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

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      idLessThan(
    Id? value, {
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

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localFoodIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localFoodId',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localFoodIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localFoodId',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localFoodIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localFoodId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localFoodIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localFoodId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localFoodIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localFoodId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localFoodIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localFoodId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      mealEqualTo(Meal value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meal',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      mealGreaterThan(
    Meal value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meal',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      mealLessThan(
    Meal value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meal',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      mealBetween(
    Meal lower,
    Meal upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      pushedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pushed',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      servingQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'servingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      servingQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'servingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      servingQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'servingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      servingQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'servingQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension LocalDiaryEntryQueryObject
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QFilterCondition> {}

extension LocalDiaryEntryQueryLinks
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QFilterCondition> {}

extension LocalDiaryEntryQuerySortBy
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QSortBy> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> sortByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByEntryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> sortByFoodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByFoodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByLocalFoodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localFoodId', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByLocalFoodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localFoodId', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> sortByMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meal', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meal', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> sortByPushed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushed', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByPushedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushed', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByServingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingQuantity', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByServingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingQuantity', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> sortByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension LocalDiaryEntryQuerySortThenBy
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QSortThenBy> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> thenByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByEntryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> thenByFoodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByFoodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByLocalFoodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localFoodId', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByLocalFoodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localFoodId', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> thenByMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meal', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meal', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> thenByPushed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushed', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByPushedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushed', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByServingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingQuantity', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByServingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servingQuantity', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> thenByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension LocalDiaryEntryQueryWhereDistinct
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct>
      distinctByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deleted');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct> distinctByEntryDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct> distinctByFoodId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct>
      distinctByLocalFoodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localFoodId');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct> distinctByMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meal');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct> distinctByPushed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pushed');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct>
      distinctByServingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'servingQuantity');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct> distinctByUnitId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension LocalDiaryEntryQueryProperty
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QQueryProperty> {
  QueryBuilder<LocalDiaryEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalDiaryEntry, bool, QQueryOperations> deletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deleted');
    });
  }

  QueryBuilder<LocalDiaryEntry, String?, QQueryOperations> entryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryDate');
    });
  }

  QueryBuilder<LocalDiaryEntry, String?, QQueryOperations> foodIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodId');
    });
  }

  QueryBuilder<LocalDiaryEntry, int?, QQueryOperations> localFoodIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localFoodId');
    });
  }

  QueryBuilder<LocalDiaryEntry, Meal, QQueryOperations> mealProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meal');
    });
  }

  QueryBuilder<LocalDiaryEntry, bool, QQueryOperations> pushedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pushed');
    });
  }

  QueryBuilder<LocalDiaryEntry, int, QQueryOperations>
      servingQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'servingQuantity');
    });
  }

  QueryBuilder<LocalDiaryEntry, String, QQueryOperations> unitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitId');
    });
  }

  QueryBuilder<LocalDiaryEntry, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
