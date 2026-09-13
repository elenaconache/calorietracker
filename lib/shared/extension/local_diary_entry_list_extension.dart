import 'package:calorietracker/shared/data/model/diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/model/meal_entries_list.dart';
import 'package:collection/collection.dart';

extension LocalDiaryEntryListExtension on List<LocalDiaryEntry> {
  List<MealEntriesList> get mealEntriesList {
    final map = groupListsBy((element) => element.meal);
    return List.generate(Meal.values.length, (index) {
      final meal = Meal.values[index];
      return MealEntriesList(
        meal: meal,
        diaryEntries:
            map[meal]?.map((e) => DiaryEntry.local(localEntry: e)).toList() ??
            [],
      );
    });
  }
}
