// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_nutrition.dart';

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
