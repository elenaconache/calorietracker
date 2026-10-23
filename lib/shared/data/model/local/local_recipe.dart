import 'package:calorietracker/shared/data/model/local/local_data_state.dart';
import 'package:calorietracker/shared/data/model/local/local_ingredient.dart';
import 'package:collection/collection.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LocalRecipe {
  @Id(assignable: true)
  int localId = 0;

  late int? remoteId;

  late String name;
  late String? description;
  late int cookedWeight;

  final localIngredients = ToMany<LocalIngredient>();

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

  LocalRecipe();

  LocalRecipe.withParams({
    this.localId = 0,
    required List<LocalIngredient> ingredients,
    this.name = '',
    this.description,
    this.cookedWeight = 0,
    this.remoteId,
    this.state = LocalDataState.pushPending,
  })  {
    localIngredients.addAll(ingredients);
  }
}
