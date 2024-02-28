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
    r'deletedEntry': PropertySchema(
      id: 0,
      name: r'deletedEntry',
      type: IsarType.bool,
    ),
    r'entryDate': PropertySchema(
      id: 1,
      name: r'entryDate',
      type: IsarType.dateTime,
    ),
    r'entryId': PropertySchema(
      id: 2,
      name: r'entryId',
      type: IsarType.string,
    ),
    r'errorPushingEntry': PropertySchema(
      id: 3,
      name: r'errorPushingEntry',
      type: IsarType.bool,
    ),
    r'meal': PropertySchema(
      id: 4,
      name: r'meal',
      type: IsarType.byte,
      enumMap: _LocalDiaryEntrymealEnumValueMap,
    ),
    r'pushedEntry': PropertySchema(
      id: 5,
      name: r'pushedEntry',
      type: IsarType.bool,
    ),
    r'servingQuantity': PropertySchema(
      id: 6,
      name: r'servingQuantity',
      type: IsarType.double,
    ),
    r'unitId': PropertySchema(
      id: 7,
      name: r'unitId',
      type: IsarType.long,
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
  idName: r'localId',
  indexes: {},
  links: {
    r'localFood': LinkSchema(
      id: 733753828691332222,
      name: r'localFood',
      target: r'LocalFood',
      single: true,
    )
  },
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
    final value = object.entryId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _localDiaryEntrySerialize(
  LocalDiaryEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.deletedEntry);
  writer.writeDateTime(offsets[1], object.entryDate);
  writer.writeString(offsets[2], object.entryId);
  writer.writeBool(offsets[3], object.errorPushingEntry);
  writer.writeByte(offsets[4], object.meal.index);
  writer.writeBool(offsets[5], object.pushedEntry);
  writer.writeDouble(offsets[6], object.servingQuantity);
  writer.writeLong(offsets[7], object.unitId);
  writer.writeString(offsets[8], object.userId);
}

LocalDiaryEntry _localDiaryEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalDiaryEntry();
  object.deletedEntry = reader.readBool(offsets[0]);
  object.entryDate = reader.readDateTime(offsets[1]);
  object.entryId = reader.readStringOrNull(offsets[2]);
  object.errorPushingEntry = reader.readBool(offsets[3]);
  object.localId = id;
  object.meal =
      _LocalDiaryEntrymealValueEnumMap[reader.readByteOrNull(offsets[4])] ??
          Meal.breakfast;
  object.pushedEntry = reader.readBool(offsets[5]);
  object.servingQuantity = reader.readDouble(offsets[6]);
  object.unitId = reader.readLong(offsets[7]);
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
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (_LocalDiaryEntrymealValueEnumMap[reader.readByteOrNull(offset)] ??
          Meal.breakfast) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
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
  return object.localId;
}

List<IsarLinkBase<dynamic>> _localDiaryEntryGetLinks(LocalDiaryEntry object) {
  return [object.localFood];
}

void _localDiaryEntryAttach(
    IsarCollection<dynamic> col, Id id, LocalDiaryEntry object) {
  object.localId = id;
  object.localFood
      .attach(col, col.isar.collection<LocalFood>(), r'localFood', id);
}

extension LocalDiaryEntryQueryWhereSort
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QWhere> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhere> anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalDiaryEntryQueryWhere
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QWhereClause> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhereClause>
      localIdEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhereClause>
      localIdNotEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhereClause>
      localIdGreaterThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhereClause>
      localIdLessThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterWhereClause>
      localIdBetween(
    Id lowerLocalId,
    Id upperLocalId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerLocalId,
        includeLower: includeLower,
        upper: upperLocalId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocalDiaryEntryQueryFilter
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QFilterCondition> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      deletedEntryEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedEntry',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'entryId',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'entryId',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      entryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entryId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      errorPushingEntryEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorPushingEntry',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localId',
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
      pushedEntryEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pushedEntry',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      servingQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'servingQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      servingQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'servingQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      servingQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'servingQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      servingQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'servingQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      unitIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QFilterCondition> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localFood(FilterQuery<LocalFood> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'localFood');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition>
      localFoodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'localFood', 0, true, 0, true);
    });
  }
}

extension LocalDiaryEntryQuerySortBy
    on QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QSortBy> {
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByDeletedEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedEntry', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByDeletedEntryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedEntry', Sort.desc);
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

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> sortByEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByErrorPushingEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorPushingEntry', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByErrorPushingEntryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorPushingEntry', Sort.desc);
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

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByPushedEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushedEntry', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      sortByPushedEntryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushedEntry', Sort.desc);
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
  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByDeletedEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedEntry', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByDeletedEntryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedEntry', Sort.desc);
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

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> thenByEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByErrorPushingEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorPushingEntry', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByErrorPushingEntryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorPushingEntry', Sort.desc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
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

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByPushedEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushedEntry', Sort.asc);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterSortBy>
      thenByPushedEntryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushedEntry', Sort.desc);
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
      distinctByDeletedEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedEntry');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct>
      distinctByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryDate');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct> distinctByEntryId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct>
      distinctByErrorPushingEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorPushingEntry');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct> distinctByMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meal');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct>
      distinctByPushedEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pushedEntry');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct>
      distinctByServingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'servingQuantity');
    });
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QDistinct> distinctByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitId');
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
  QueryBuilder<LocalDiaryEntry, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<LocalDiaryEntry, bool, QQueryOperations> deletedEntryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedEntry');
    });
  }

  QueryBuilder<LocalDiaryEntry, DateTime, QQueryOperations>
      entryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryDate');
    });
  }

  QueryBuilder<LocalDiaryEntry, String?, QQueryOperations> entryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryId');
    });
  }

  QueryBuilder<LocalDiaryEntry, bool, QQueryOperations>
      errorPushingEntryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorPushingEntry');
    });
  }

  QueryBuilder<LocalDiaryEntry, Meal, QQueryOperations> mealProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meal');
    });
  }

  QueryBuilder<LocalDiaryEntry, bool, QQueryOperations> pushedEntryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pushedEntry');
    });
  }

  QueryBuilder<LocalDiaryEntry, double, QQueryOperations>
      servingQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'servingQuantity');
    });
  }

  QueryBuilder<LocalDiaryEntry, int, QQueryOperations> unitIdProperty() {
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
