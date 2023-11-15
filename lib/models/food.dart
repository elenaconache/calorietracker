import 'package:calorietracker/features/create_food/food_input.dart';
import 'package:calorietracker/models/collection/add_food_request.dart';
import 'package:calorietracker/models/collection/collection_food.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_food_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  final String name;
  final Nutrition nutrition;
  final String? brandName;
  final String? id;
  final String? barcode;

  const Food({
    required this.name,
    required this.nutrition,
    required this.brandName,
    required this.id,
    required this.barcode,
  });

  Food.nutritionix({required NutritionixFoodResponse nutritionixFoodResponse})
      : name = nutritionixFoodResponse.name,
        nutrition = nutritionixFoodResponse.nutritionPer100Grams,
        brandName = nutritionixFoodResponse.brandName,
        barcode = null,
        id = null;

  Food.input({required FoodInput foodInput, required this.id})
      : name = foodInput.name,
        nutrition = Nutrition.fromServing(
          nutritionPerServing: foodInput.nutrition,
          servingSizeGrams: foodInput.servingSizeValue,
        ),
        brandName = (foodInput.brand?.isEmpty ?? true) ? null : foodInput.brand,
        barcode = null;

  Food.collection({required CollectionFood food})
      : name = food.name,
        nutrition = food.nutritionInfo,
        barcode = food.barcode,
        brandName = food.brand,
        id = food.id;

  Food.local({required LocalFood localFood})
      : name = localFood.name,
        nutrition = Nutrition.local(localNutrition: localFood.nutritionInfo),
        brandName = localFood.brand,
        id = null,
        barcode = localFood.barcode;

  LocalFood get localFood => LocalFood()
    ..nutritionInfo = nutrition.localFoodNutrition
    ..name = name
    ..brand = brandName
    ..barcode = barcode
    ..pushed = id != null
    ..createdAtDate = DateTime.now()
    ..foodId = id;

  AddFoodRequest get addFoodRequest => AddFoodRequest(
        barcode: null,
        name: name,
        brand: brandName,
        nutritionInfo: nutrition.round(),
      );

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);

  @override
  String toString() => toJson().toString();
}
