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
    r'food': PropertySchema(
      id: 2,
      name: r'food',
      type: IsarType.object,
      target: r'LocalDiaryFood',
    ),
    r'meal': PropertySchema(
      id: 3,
      name: r'meal',
      type: IsarType.byte,
      enumMap: _LocalDiaryEntrymealEnumValueMap,
    ),
    r'pushed': PropertySchema(
      id: 4,
      name: r'pushed',
      type: IsarType.bool,
    ),
    r'servingQuantity': PropertySchema(
      id: 5,
      name: r'servingQuantity',
      type: IsarType.long,
    ),
    r'unitId': PropertySchema(
      id: 6,
      name: r'unitId',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 7,
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
  embeddedSchemas: {
    r'LocalDiaryFood': LocalDiaryFoodSchema,
    r'LocalNutrition': LocalNutritionSchema
  },
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
    final value = object.food;
    if (value != null) {
      bytesCount += 3 +
          LocalDiaryFoodSchema.estimateSize(
              value, allOffsets[LocalDiaryFood]!, allOffsets);
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
  writer.writeObject<LocalDiaryFood>(
    offsets[2],
    allOffsets,
    LocalDiaryFoodSchema.serialize,
    object.food,
  );
  writer.writeByte(offsets[3], object.meal.index);
  writer.writeBool(offsets[4], object.pushed);
  writer.writeLong(offsets[5], object.servingQuantity);
  writer.writeString(offsets[6], object.unitId);
  writer.writeString(offsets[7], object.userId);
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
  object.food = reader.readObjectOrNull<LocalDiaryFood>(
    offsets[2],
    LocalDiaryFoodSchema.deserialize,
    allOffsets,
  );
  object.id = id;
  object.meal =
      _LocalDiaryEntrymealValueEnumMap[reader.readByteOrNull(offsets[3])] ??
          Meal.breakfast;
  object.pushed = reader.readBool(offsets[4]);
  object.servingQuantity = reader.readLong(offsets[5]);
  object.unitId = reader.readString(offsets[6]);
  object.userId = reader.readString(offsets[7]);
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
      return (reader.readObjectOrNull<LocalDiaryFood>(
        offset,
        LocalDiaryFoodSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (_LocalDiaryEntrymealValueEnumMap[reader.readByteOrNull(offset)] ??
          Meal.breakfast) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
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
      foodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'food',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      foodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'food',
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
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QFilterCondition> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition> food(
      FilterQuery<LocalDiaryFood> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'food');
    });
  }
}

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

  QueryBuilder<LocalDiaryEntry, LocalDiaryFood?, QQueryOperations>
      foodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'food');
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

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LocalDiaryFoodSchema = Schema(
  name: r'LocalDiaryFood',
  id: -5155966677480490508,
  properties: {
    r'barcode': PropertySchema(
      id: 0,
      name: r'barcode',
      type: IsarType.string,
    ),
    r'brand': PropertySchema(
      id: 1,
      name: r'brand',
      type: IsarType.string,
    ),
    r'foodId': PropertySchema(
      id: 2,
      name: r'foodId',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'nutritionInfo': PropertySchema(
      id: 4,
      name: r'nutritionInfo',
      type: IsarType.object,
      target: r'LocalNutrition',
    )
  },
  estimateSize: _localDiaryFoodEstimateSize,
  serialize: _localDiaryFoodSerialize,
  deserialize: _localDiaryFoodDeserialize,
  deserializeProp: _localDiaryFoodDeserializeProp,
);

int _localDiaryFoodEstimateSize(
  LocalDiaryFood object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.barcode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.brand;
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
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 +
      LocalNutritionSchema.estimateSize(
          object.nutritionInfo, allOffsets[LocalNutrition]!, allOffsets);
  return bytesCount;
}

void _localDiaryFoodSerialize(
  LocalDiaryFood object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.barcode);
  writer.writeString(offsets[1], object.brand);
  writer.writeString(offsets[2], object.foodId);
  writer.writeString(offsets[3], object.name);
  writer.writeObject<LocalNutrition>(
    offsets[4],
    allOffsets,
    LocalNutritionSchema.serialize,
    object.nutritionInfo,
  );
}

LocalDiaryFood _localDiaryFoodDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalDiaryFood();
  object.barcode = reader.readStringOrNull(offsets[0]);
  object.brand = reader.readStringOrNull(offsets[1]);
  object.foodId = reader.readStringOrNull(offsets[2]);
  object.name = reader.readString(offsets[3]);
  object.nutritionInfo = reader.readObjectOrNull<LocalNutrition>(
        offsets[4],
        LocalNutritionSchema.deserialize,
        allOffsets,
      ) ??
      LocalNutrition();
  return object;
}

P _localDiaryFoodDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<LocalNutrition>(
            offset,
            LocalNutritionSchema.deserialize,
            allOffsets,
          ) ??
          LocalNutrition()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LocalDiaryFoodQueryFilter
    on QueryBuilder<LocalDiaryFood, LocalDiaryFood, QFilterCondition> {
  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'barcode',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'barcode',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'barcode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'barcode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      barcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      foodIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'foodId',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      foodIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'foodId',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
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

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
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

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
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

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
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

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
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

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
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

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      foodIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foodId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      foodIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foodId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      foodIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      foodIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foodId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension LocalDiaryFoodQueryObject
    on QueryBuilder<LocalDiaryFood, LocalDiaryFood, QFilterCondition> {
  QueryBuilder<LocalDiaryFood, LocalDiaryFood, QAfterFilterCondition>
      nutritionInfo(FilterQuery<LocalNutrition> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'nutritionInfo');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LocalNutritionSchema = Schema(
  name: r'LocalNutrition',
  id: 711503537225180010,
  properties: {
    r'calcium': PropertySchema(
      id: 0,
      name: r'calcium',
      type: IsarType.double,
    ),
    r'calories': PropertySchema(
      id: 1,
      name: r'calories',
      type: IsarType.double,
    ),
    r'carbohydrates': PropertySchema(
      id: 2,
      name: r'carbohydrates',
      type: IsarType.double,
    ),
    r'cholesterol': PropertySchema(
      id: 3,
      name: r'cholesterol',
      type: IsarType.double,
    ),
    r'fat': PropertySchema(
      id: 4,
      name: r'fat',
      type: IsarType.double,
    ),
    r'fatMonounsaturated': PropertySchema(
      id: 5,
      name: r'fatMonounsaturated',
      type: IsarType.double,
    ),
    r'fatPolyunsaturated': PropertySchema(
      id: 6,
      name: r'fatPolyunsaturated',
      type: IsarType.double,
    ),
    r'fatSaturated': PropertySchema(
      id: 7,
      name: r'fatSaturated',
      type: IsarType.double,
    ),
    r'fatTrans': PropertySchema(
      id: 8,
      name: r'fatTrans',
      type: IsarType.double,
    ),
    r'fiber': PropertySchema(
      id: 9,
      name: r'fiber',
      type: IsarType.double,
    ),
    r'insolubleFiber': PropertySchema(
      id: 10,
      name: r'insolubleFiber',
      type: IsarType.double,
    ),
    r'iron': PropertySchema(
      id: 11,
      name: r'iron',
      type: IsarType.double,
    ),
    r'potassium': PropertySchema(
      id: 12,
      name: r'potassium',
      type: IsarType.double,
    ),
    r'protein': PropertySchema(
      id: 13,
      name: r'protein',
      type: IsarType.double,
    ),
    r'sodium': PropertySchema(
      id: 14,
      name: r'sodium',
      type: IsarType.double,
    ),
    r'sugar': PropertySchema(
      id: 15,
      name: r'sugar',
      type: IsarType.double,
    ),
    r'vitaminA': PropertySchema(
      id: 16,
      name: r'vitaminA',
      type: IsarType.double,
    ),
    r'vitaminC': PropertySchema(
      id: 17,
      name: r'vitaminC',
      type: IsarType.double,
    ),
    r'vitaminD': PropertySchema(
      id: 18,
      name: r'vitaminD',
      type: IsarType.double,
    )
  },
  estimateSize: _localNutritionEstimateSize,
  serialize: _localNutritionSerialize,
  deserialize: _localNutritionDeserialize,
  deserializeProp: _localNutritionDeserializeProp,
);

int _localNutritionEstimateSize(
  LocalNutrition object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _localNutritionSerialize(
  LocalNutrition object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.calcium);
  writer.writeDouble(offsets[1], object.calories);
  writer.writeDouble(offsets[2], object.carbohydrates);
  writer.writeDouble(offsets[3], object.cholesterol);
  writer.writeDouble(offsets[4], object.fat);
  writer.writeDouble(offsets[5], object.fatMonounsaturated);
  writer.writeDouble(offsets[6], object.fatPolyunsaturated);
  writer.writeDouble(offsets[7], object.fatSaturated);
  writer.writeDouble(offsets[8], object.fatTrans);
  writer.writeDouble(offsets[9], object.fiber);
  writer.writeDouble(offsets[10], object.insolubleFiber);
  writer.writeDouble(offsets[11], object.iron);
  writer.writeDouble(offsets[12], object.potassium);
  writer.writeDouble(offsets[13], object.protein);
  writer.writeDouble(offsets[14], object.sodium);
  writer.writeDouble(offsets[15], object.sugar);
  writer.writeDouble(offsets[16], object.vitaminA);
  writer.writeDouble(offsets[17], object.vitaminC);
  writer.writeDouble(offsets[18], object.vitaminD);
}

LocalNutrition _localNutritionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalNutrition();
  object.calcium = reader.readDouble(offsets[0]);
  object.calories = reader.readDouble(offsets[1]);
  object.carbohydrates = reader.readDouble(offsets[2]);
  object.cholesterol = reader.readDouble(offsets[3]);
  object.fat = reader.readDouble(offsets[4]);
  object.fatMonounsaturated = reader.readDouble(offsets[5]);
  object.fatPolyunsaturated = reader.readDouble(offsets[6]);
  object.fatSaturated = reader.readDouble(offsets[7]);
  object.fatTrans = reader.readDouble(offsets[8]);
  object.fiber = reader.readDouble(offsets[9]);
  object.insolubleFiber = reader.readDouble(offsets[10]);
  object.iron = reader.readDouble(offsets[11]);
  object.potassium = reader.readDouble(offsets[12]);
  object.protein = reader.readDouble(offsets[13]);
  object.sodium = reader.readDouble(offsets[14]);
  object.sugar = reader.readDouble(offsets[15]);
  object.vitaminA = reader.readDouble(offsets[16]);
  object.vitaminC = reader.readDouble(offsets[17]);
  object.vitaminD = reader.readDouble(offsets[18]);
  return object;
}

P _localNutritionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LocalNutritionQueryFilter
    on QueryBuilder<LocalNutrition, LocalNutrition, QFilterCondition> {
  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      calciumEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calcium',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      calciumGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calcium',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      calciumLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calcium',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      calciumBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calcium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      caloriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      caloriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      caloriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      caloriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      carbohydratesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbohydrates',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      carbohydratesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbohydrates',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      carbohydratesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbohydrates',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      carbohydratesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbohydrates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      cholesterolEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cholesterol',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      cholesterolGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cholesterol',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      cholesterolLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cholesterol',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      cholesterolBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cholesterol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatMonounsaturatedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatMonounsaturated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatMonounsaturatedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fatMonounsaturated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatMonounsaturatedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fatMonounsaturated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatMonounsaturatedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fatMonounsaturated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatPolyunsaturatedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatPolyunsaturated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatPolyunsaturatedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fatPolyunsaturated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatPolyunsaturatedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fatPolyunsaturated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatPolyunsaturatedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fatPolyunsaturated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatSaturatedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatSaturated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatSaturatedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fatSaturated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatSaturatedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fatSaturated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatSaturatedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fatSaturated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatTransEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatTrans',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatTransGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fatTrans',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatTransLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fatTrans',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fatTransBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fatTrans',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fiberEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fiberGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fiber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fiberLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fiber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      fiberBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fiber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      insolubleFiberEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insolubleFiber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      insolubleFiberGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'insolubleFiber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      insolubleFiberLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'insolubleFiber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      insolubleFiberBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'insolubleFiber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      ironEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iron',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      ironGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iron',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      ironLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iron',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      ironBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iron',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      potassiumEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'potassium',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      potassiumGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'potassium',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      potassiumLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'potassium',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      potassiumBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'potassium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      proteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      proteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      proteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      proteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'protein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      sodiumEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sodium',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      sodiumGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sodium',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      sodiumLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sodium',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      sodiumBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sodium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      sugarEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sugar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      sugarGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sugar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      sugarLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sugar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      sugarBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sugar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminAEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vitaminA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminAGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vitaminA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminALessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vitaminA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminABetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vitaminA',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminCEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vitaminC',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminCGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vitaminC',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminCLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vitaminC',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminCBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vitaminC',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminDEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vitaminD',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminDGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vitaminD',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminDLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vitaminD',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalNutrition, LocalNutrition, QAfterFilterCondition>
      vitaminDBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vitaminD',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension LocalNutritionQueryObject
    on QueryBuilder<LocalNutrition, LocalNutrition, QFilterCondition> {}
