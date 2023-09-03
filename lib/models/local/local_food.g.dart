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
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'nutritionInfo': PropertySchema(
      id: 3,
      name: r'nutritionInfo',
      type: IsarType.object,
      target: r'LocalNutrition',
    )
  },
  estimateSize: _localFoodEstimateSize,
  serialize: _localFoodSerialize,
  deserialize: _localFoodDeserialize,
  deserializeProp: _localFoodDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'LocalNutrition': LocalNutritionSchema},
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
      LocalNutritionSchema.estimateSize(
          object.nutritionInfo, allOffsets[LocalNutrition]!, allOffsets);
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
  writer.writeString(offsets[2], object.name);
  writer.writeObject<LocalNutrition>(
    offsets[3],
    allOffsets,
    LocalNutritionSchema.serialize,
    object.nutritionInfo,
  );
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
  object.id = id;
  object.name = reader.readString(offsets[2]);
  object.nutritionInfo = reader.readObjectOrNull<LocalNutrition>(
        offsets[3],
        LocalNutritionSchema.deserialize,
        allOffsets,
      ) ??
      LocalNutrition();
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
      return (reader.readString(offset)) as P;
    case 3:
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

Id _localFoodGetId(LocalFood object) {
  return object.id ?? Isar.autoIncrement;
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> idBetween(
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
}

extension LocalFoodQueryObject
    on QueryBuilder<LocalFood, LocalFood, QFilterCondition> {
  QueryBuilder<LocalFood, LocalFood, QAfterFilterCondition> nutritionInfo(
      FilterQuery<LocalNutrition> q) {
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

  QueryBuilder<LocalFood, LocalFood, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
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

  QueryBuilder<LocalFood, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<LocalFood, LocalNutrition, QQueryOperations>
      nutritionInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nutritionInfo');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

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
