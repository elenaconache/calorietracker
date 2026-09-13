import 'package:calorietracker/shared/constants.dart';
import 'package:calorietracker/shared/data/model/local/local_data_state.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:collection/collection.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LocalIngredient {
  @Id(assignable: true)
  int localId = 0;

  late int unitId;
  late double servingQuantity;

  final localFood = ToOne<LocalFood>();

  @Transient()
  late LocalDataState state;

  String get dbState {
    return state.name;
  }

  set dbState(String value) {
    state =
        LocalDataState.values.firstWhereOrNull(
          (element) => element.name == value,
        ) ??
        LocalDataState.pushPending;
  }

  LocalIngredient();

  LocalIngredient.withParams({
    this.localId = 0,
    this.unitId = collectionGramsUnitId,
    required this.servingQuantity,
    required int localFoodId,
  }) {
    localFood.targetId = localFoodId;
    state = LocalDataState.pushPending;
  }
}
