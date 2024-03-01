// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_food.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalFoodCollection on Isar {
  IsarCollection<LocalFood> get localFoods => this.collection();
}

const LocalFoodSchema = CollectionSchema(
  name: r'LocalFood',
  id: -5547547111221407026,
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
    r'createdAtDate': PropertySchema(
      id: 2,
      name: r'createdAtDate',
      type: IsarType.dateTime,
    ),
    r'deleted': PropertySchema(
      id: 3,
      name: r'deleted',
      type: IsarType.bool,
    ),
    r'errorPushing': PropertySchema(
      id: 4,
      name: r'errorPushing',
      type: IsarType.bool,
    ),
    r'foodId': PropertySchema(
      id: 5,
      name: r'foodId',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'nutritionInfo': PropertySchema(
      id: 7,
      name: r'nutritionInfo',
      type: IsarType.object,
      target: r'LocalFoodNutrition',
    ),
    r'pushed': PropertySchema(
      id: 8,
      name: r'pushed',
      type: IsarType.bool,
    )
  },
  estimateSize: _localFoodEstimateSize,
  serialize: _localFoodSerialize,
  deserialize: _localFoodDeserialize,
  deserializeProp: _localFoodDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'LocalFoodNutrition': LocalFoodNutritionSchema},
  getId: _localFoodGetId,
  getLinks: _localFoodGetLinks,
  attach: _localFoodAttach,
  version: '3.1.0+1',
);

int _localFoodEstimateSize(
  LocalFood object,
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
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 +
      LocalFoodNutritionSchema.estimateSize(
          object.nutritionInfo, allOffsets[LocalFoodNutrition]!, allOffsets);
  return bytesCount;
}

void _localFoodSerialize(
  LocalFood object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.barcode);
  writer.writeString(offsets[1], object.brand);
  writer.writeDateTime(offsets[2], object.createdAtDate);
  writer.writeBool(offsets[3], object.deleted);
  writer.writeBool(offsets[4], object.errorPushing);
  writer.writeLong(offsets[5], object.foodId);
  writer.writeString(offsets[6], object.name);
  writer.writeObject<LocalFoodNutrition>(
    offsets[7],
    allOffsets,
    LocalFoodNutritionSchema.serialize,
    object.nutritionInfo,
  );
  writer.writeBool(offsets[8], object.pushed);
}

LocalFood _localFoodDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalFood();
  object.barcode = reader.readStringOrNull(offsets[0]);
  object.brand = reader.readStringOrNull(offsets[1]);
  object.createdAtDate = reader.readDateTime(offsets[2]);
  object.deleted = reader.readBool(offsets[3]);
  object.errorPushing = reader.readBool(offsets[4]);
  object.foodId = reader.readLongOrNull(offsets[5]);
  object.id = id;
  object.name = reader.readString(offsets[6]);
  object.nutritionInfo = reader.readObjectOrNull<LocalFoodNutrition>(
        offsets[7],
        LocalFoodNutritionSchema.deserialize,
        allOffsets,
      ) ??
      LocalFoodNutrition();
  object.pushed = reader.readBool(offsets[8]);
  return object;
}

P _localFoodDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readObjectOrNull<LocalFoodNutrition>(
            offset,
            LocalFoodNutritionSchema.deserialize,
            allOffsets,
          ) ??
          LocalFoodNutrition()) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localFoodGetId(LocalFood object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localFoodGetLinks(LocalFood object) {
  return [];
}

void _localFoodAttach(IsarCollection<dynamic> col, Id id, LocalFood object) {
  object.id = id;
}

extension LocalFoodQueryWhereSort
    on QueryBuilder<LocalFood, LocalFood, QWhere> {
  QueryBuilder<LocalFood, LocalFood, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalFoodQueryWhere
    on QueryBuilder<LocalFood, LocalFood, QWhereClause> {
  QueryBuilder<LocalFood, LocalFood, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<LocalFood, LocalFood, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterWhereClause> idBetween(
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

extension LocalFoodQueryFilter
    on QueryBuilder<LocalFood, LocalFood, QFilterCondition> {
  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> barcodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'barcode',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> barcodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'barcode',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> barcodeEqualTo(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> barcodeGreaterThan(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> barcodeLessThan(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> barcodeBetween(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> barcodeStartsWith(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> barcodeEndsWith(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> barcodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> barcodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'barcode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> barcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition>
      barcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandEqualTo(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandGreaterThan(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandLessThan(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandBetween(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandStartsWith(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandEndsWith(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition>
      createdAtDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAtDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition>
      createdAtDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAtDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition>
      createdAtDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAtDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition>
      createdAtDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAtDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> deletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deleted',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> errorPushingEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorPushing',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> foodIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'foodId',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> foodIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'foodId',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> foodIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> foodIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> foodIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> foodIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> pushedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pushed',
        value: value,
      ));
    });
  }
}

extension LocalFoodQueryObject
    on QueryBuilder<LocalFood, LocalFood, QFilterCondition> {
  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nutritionInfo(
      FilterQuery<LocalFoodNutrition> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'nutritionInfo');
    });
  }
}

extension LocalFoodQueryLinks
    on QueryBuilder<LocalFood, LocalFood, QFilterCondition> {}

extension LocalFoodQuerySortBy on QueryBuilder<LocalFood, LocalFood, QSortBy> {
  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByCreatedAtDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAtDate', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByCreatedAtDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAtDate', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByErrorPushing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorPushing', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByErrorPushingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorPushing', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByFoodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByFoodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByPushed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushed', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> sortByPushedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushed', Sort.desc);
    });
  }
}

extension LocalFoodQuerySortThenBy
    on QueryBuilder<LocalFood, LocalFood, QSortThenBy> {
  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByCreatedAtDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAtDate', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByCreatedAtDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAtDate', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByErrorPushing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorPushing', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByErrorPushingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorPushing', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByFoodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByFoodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodId', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByPushed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushed', Sort.asc);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterSortBy> thenByPushedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pushed', Sort.desc);
    });
  }
}

extension LocalFoodQueryWhereDistinct
    on QueryBuilder<LocalFood, LocalFood, QDistinct> {
  QueryBuilder<LocalFood, LocalFood, QDistinct> distinctByBarcode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'barcode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QDistinct> distinctByCreatedAtDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAtDate');
    });
  }

  QueryBuilder<LocalFood, LocalFood, QDistinct> distinctByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deleted');
    });
  }

  QueryBuilder<LocalFood, LocalFood, QDistinct> distinctByErrorPushing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorPushing');
    });
  }

  QueryBuilder<LocalFood, LocalFood, QDistinct> distinctByFoodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodId');
    });
  }

  QueryBuilder<LocalFood, LocalFood, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalFood, LocalFood, QDistinct> distinctByPushed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pushed');
    });
  }
}

extension LocalFoodQueryProperty
    on QueryBuilder<LocalFood, LocalFood, QQueryProperty> {
  QueryBuilder<LocalFood, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalFood, String?, QQueryOperations> barcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'barcode');
    });
  }

  QueryBuilder<LocalFood, String?, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<LocalFood, DateTime, QQueryOperations> createdAtDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAtDate');
    });
  }

  QueryBuilder<LocalFood, bool, QQueryOperations> deletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deleted');
    });
  }

  QueryBuilder<LocalFood, bool, QQueryOperations> errorPushingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorPushing');
    });
  }

  QueryBuilder<LocalFood, int?, QQueryOperations> foodIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodId');
    });
  }

  QueryBuilder<LocalFood, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<LocalFood, LocalFoodNutrition, QQueryOperations>
      nutritionInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nutritionInfo');
    });
  }

  QueryBuilder<LocalFood, bool, QQueryOperations> pushedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pushed');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LocalFoodNutritionSchema = Schema(
  name: r'LocalFoodNutrition',
  id: -2132336367375358205,
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
  estimateSize: _localFoodNutritionEstimateSize,
  serialize: _localFoodNutritionSerialize,
  deserialize: _localFoodNutritionDeserialize,
  deserializeProp: _localFoodNutritionDeserializeProp,
);

int _localFoodNutritionEstimateSize(
  LocalFoodNutrition object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _localFoodNutritionSerialize(
  LocalFoodNutrition object,
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

LocalFoodNutrition _localFoodNutritionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalFoodNutrition();
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

P _localFoodNutritionDeserializeProp<P>(
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

extension LocalFoodNutritionQueryFilter
    on QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QFilterCondition> {
  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

  QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QAfterFilterCondition>
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

extension LocalFoodNutritionQueryObject
    on QueryBuilder<LocalFoodNutrition, LocalFoodNutrition, QFilterCondition> {}
