import 'package:calorietracker/feature/create_food/ui/food_input.dart';
import 'package:calorietracker/shared/model/collection/add_food_request.dart';
import 'package:calorietracker/shared/model/collection/collection_food.dart';
import 'package:calorietracker/shared/model/local/local_food.dart';
import 'package:calorietracker/shared/model/nutrition.dart';
import 'package:calorietracker/shared/model/nutritionix/nutritionix_food_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  final String name;
  final Nutrition nutrition;
  final String? brandName;
  final int? id;
  final String? barcode;
  final int? localId;

  const Food({
    required this.name,
    required this.nutrition,
    required this.brandName,
    required this.id,
    required this.barcode,
    this.localId,
  });

  Food.nutritionix({required NutritionixFoodResponse nutritionixFoodResponse})
      : name = nutritionixFoodResponse.name,
        nutrition = nutritionixFoodResponse.nutritionPer100Grams,
        brandName = nutritionixFoodResponse.brandName,
        barcode = null,
        id = null,
        localId = null;

  Food.input({required FoodInput foodInput, required this.id})
      : name = foodInput.name,
        nutrition = Nutrition.fromServing(
          nutritionPerServing: foodInput.nutrition,
          servingSizeGrams: foodInput.servingSizeValue,
        ),
        brandName = (foodInput.brand?.isEmpty ?? true) ? null : foodInput.brand,
        barcode = null,
        localId = null;

  Food.collection({required CollectionFood food})
      : name = food.name,
        nutrition = food.nutritionInfo,
        barcode = food.barcode,
        brandName = food.brand,
        id = food.id,
        localId = null;

  Food.local({required LocalFood localFood})
      : name = localFood.name,
        nutrition = localFood.nutrition,
        brandName = localFood.brand,
        id = null,
        barcode = localFood.barcode,
        localId = localFood.id;

  LocalFood get localFood {
    final localFood = LocalFood(
      calcium: nutrition.calcium,
      calories: nutrition.calories,
      carbohydrates: nutrition.carbohydrates,
      cholesterol: nutrition.cholesterol,
      fat: nutrition.fat,
      fatMonounsaturated: nutrition.fatMonounsaturated,
      fatPolyunsaturated: nutrition.fatPolyunsaturated,
      fatSaturated: nutrition.fatSaturated,
      fatTrans: nutrition.fatTrans,
      fiber: nutrition.fiber,
      insolubleFiber: nutrition.insolubleFiber,
      iron: nutrition.iron,
      potassium: nutrition.potassium,
      protein: nutrition.protein,
      sodium: nutrition.sodium,
      sugar: nutrition.sugar,
      vitaminA: nutrition.vitaminA,
      vitaminC: nutrition.vitaminC,
      vitaminD: nutrition.vitaminD,
      name: name,
      brand: brandName,
      barcode: barcode,
      pushed: id != null,
      createdAtDate: DateTime.now(),
      foodId:  id,
      id : localId ?? 0,
    );
    return localFood;
  }

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

  Food copyWith({
    String? name,
    Nutrition? nutrition,
    String? brandName,
    int? id,
    String? barcode,
    int? localId,
  }) =>
      Food(
        name: name ?? this.name,
        id: id ?? this.id,
        barcode: barcode ?? this.barcode,
        nutrition: nutrition ?? this.nutrition,
        brandName: brandName ?? this.brandName,
        localId: localId ?? this.localId,
      );
}
