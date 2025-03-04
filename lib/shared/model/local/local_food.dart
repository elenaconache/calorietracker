import 'package:calorietracker/shared/model/collection/add_local_food_request.dart';
import 'package:calorietracker/shared/model/nutrition.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LocalFood {
  @Id(assignable: true)
  int id;

  double calories;
  double fat;
  double fatSaturated;
  double fatTrans;
  double fatPolyunsaturated;
  double fatMonounsaturated;
  double cholesterol;
  double carbohydrates;
  double fiber;
  double insolubleFiber;
  double sugar;
  double protein;
  double sodium;
  double potassium;
  double calcium;
  double iron;
  double vitaminA;
  double vitaminC;
  double vitaminD;

  String? barcode;
  late String name;
  String? brand;
  bool pushed = false;
  bool deleted = false;
  bool errorPushing = false;

  @Unique(onConflict: ConflictStrategy.replace)
  int? foodId;

  @Property(type: PropertyType.date)
  late DateTime createdAtDate;

  @override
  String toString() {
    return '{barcode: $barcode, name: $name, brand: $brand, pushed: $pushed, deleted: $deleted, errorPushing: $errorPushing, '
        'foodId: $foodId, createdAtDate: $createdAtDate}';
  }

  @Transient()
  Nutrition get nutrition => Nutrition(
        calcium: calcium,
        calories: calories,
        carbohydrates: carbohydrates,
        cholesterol: cholesterol,
        fat: fat,
        fatMonounsaturated: fatMonounsaturated,
        fatPolyunsaturated: fatPolyunsaturated,
        fatSaturated: fatSaturated,
        fatTrans: fatTrans,
        fiber: fiber,
        insolubleFiber: insolubleFiber,
        iron: iron,
        potassium: potassium,
        protein: protein,
        sodium: sodium,
        sugar: sugar,
        vitaminA: vitaminA,
        vitaminC: vitaminC,
        vitaminD: vitaminD,
      );

  @Transient()
  AddLocalFoodRequest get addLocalFoodRequest => AddLocalFoodRequest(
        localId: id,
        name: name,
        nutritionInfo: Nutrition(
          calories: calories,
          fat: fat,
          fatSaturated: fatSaturated,
          fatTrans: fatTrans,
          fatPolyunsaturated: fatPolyunsaturated,
          fatMonounsaturated: fatMonounsaturated,
          cholesterol: cholesterol,
          carbohydrates: carbohydrates,
          fiber: fiber,
          insolubleFiber: insolubleFiber,
          sugar: sugar,
          protein: protein,
          sodium: sodium,
          potassium: potassium,
          calcium: calcium,
          iron: iron,
          vitaminA: vitaminA,
          vitaminC: vitaminC,
          vitaminD: vitaminD,
        ),
      );

  int compareCreatedAtDateDesc(LocalFood second) => -createdAtDate.compareTo(second.createdAtDate);

  LocalFood({
    this.id = 0,
    this.barcode,
    required this.name,
    this.brand,
    this.pushed = false,
    this.deleted = false,
    this.errorPushing = false,
    this.foodId,
    required this.createdAtDate,
    this.calories = 0,
    this.fat = 0,
    this.fatTrans = 0,
    this.fatSaturated = 0,
    this.fatPolyunsaturated = 0,
    this.fatMonounsaturated = 0,
    this.cholesterol = 0,
    this.carbohydrates = 0,
    this.fiber = 0,
    this.insolubleFiber = 0,
    this.sugar = 0,
    this.protein = 0,
    this.sodium = 0,
    this.potassium = 0,
    this.calcium = 0,
    this.iron = 0,
    this.vitaminA = 0,
    this.vitaminC = 0,
    this.vitaminD = 0,
  });
}
