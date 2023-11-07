import 'dart:async';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/collection/meal_entries_response.dart';
import 'package:calorietracker/models/diary_entry.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/meal_entries_list.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/services/api/collection_api_service.dart';
import 'package:calorietracker/services/database/diary_entry_service.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class DiaryService {
  final ValueNotifier<FutureResponse<List<MealEntriesList>>> dayMealEntries = ValueNotifier(FutureResponse.loading());
  final ValueNotifier<bool> diaryEditModeEnabled = ValueNotifier(false);
  final ValueNotifier<List<DiaryEntry>> checkedDiaryEntries = ValueNotifier([]);

  late final ValueNotifier<String> selectedDay;
  late final DateFormattingService _dateFormattingService;

  DiaryService() {
    _dateFormattingService = locator<DateFormattingService>();
    selectedDay = ValueNotifier(_dateFormattingService.format(
      dateTime: DateTime.now().toString(),
      format: collectionApiDateFormat,
    ));
  }

  Nutrition get selectedDayNutrition {
    final allDiaryEntries = _allMealsDiaryEntries;
    if (allDiaryEntries.isEmpty) {
      return const Nutrition();
    } else {
      return _getTotalNutrition(allDiaryEntries);
    }
  }

  List<DiaryEntry> get _allMealsDiaryEntries =>
      dayMealEntries.value.data?.expand((mealEntries) => mealEntries.diaryEntries).toList() ?? [];

  Nutrition _getTotalNutrition(List<DiaryEntry> allDiaryEntries) {
    return allDiaryEntries.fold(const Nutrition(), (previousValue, element) {
      final nutritionPerServing = Nutrition.perServing(
        nutritionPer100Grams: element.food.nutrition,
        servingSizeGrams: element.servingQuantity.toDouble(),
      );
      return Nutrition(
        calories: previousValue.calories + nutritionPerServing.calories,
        fat: previousValue.fat + nutritionPerServing.fat,
        fatSaturated: previousValue.fatSaturated + nutritionPerServing.fatSaturated,
        fatTrans: previousValue.fatTrans + nutritionPerServing.fatTrans,
        fatPolyunsaturated: previousValue.fatPolyunsaturated + nutritionPerServing.fatPolyunsaturated,
        fatMonounsaturated: previousValue.fatMonounsaturated + nutritionPerServing.fatMonounsaturated,
        cholesterol: previousValue.cholesterol + nutritionPerServing.cholesterol,
        carbohydrates: previousValue.carbohydrates + nutritionPerServing.carbohydrates,
        fiber: previousValue.fiber + nutritionPerServing.fiber,
        sugar: previousValue.sugar + nutritionPerServing.sugar,
        protein: previousValue.protein + nutritionPerServing.protein,
        sodium: previousValue.sodium + nutritionPerServing.sodium,
        potassium: previousValue.potassium + nutritionPerServing.potassium,
        calcium: previousValue.calcium + nutritionPerServing.calcium,
        iron: previousValue.iron + nutritionPerServing.iron,
        vitaminA: previousValue.vitaminA + nutritionPerServing.vitaminA,
        vitaminC: previousValue.vitaminC + nutritionPerServing.vitaminC,
        vitaminD: previousValue.vitaminD + nutritionPerServing.vitaminD,
      );
    });
  }

  Future<void> fetchDiary({DateTime? date}) async {
    exitEditMode();
    final fetchedDate = _dateFormattingService.format(
      dateTime: (date ?? DateTime.now()).toString(),
      format: collectionApiDateFormat,
    );
    selectedDay.value = fetchedDate;
    dayMealEntries.value = FutureResponse.loading();
    final apiService = await locator.getAsync<CollectionApiService>();
    final userId = locator<UserService>().selectedUser.value?.id;
    if (userId?.isEmpty ?? true) {
      // TODO: navigate to login and show error snack bar
    } else {
      final diary = await (apiService.getDiaryEntries(userId: userId!, date: fetchedDate).then((response) async {
        return _mergeRemoteAndLocalDiaries(collectionDiary: response, diaryDate: fetchedDate, userId: userId);
      }).catchError((error, stackTrace) async {
        locator<LoggingService>().handle(error, stackTrace);
        final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
        final localDiary = await diaryEntriesService.getDisplayDiaryEntries(date: fetchedDate);
        return localDiary;
      }));
      dayMealEntries.value = FutureResponse.success(diary);
    }
  }

  Nutrition getSelectedDayMealNutrients({required Meal meal}) {
    final diaryEntries =
        dayMealEntries.value.data?.firstWhereOrNull((mealEntries) => mealEntries.meal == meal)?.diaryEntries;
    if (diaryEntries == null) {
      return const Nutrition();
    } else {
      return _getTotalNutrition(diaryEntries);
    }
  }

  List<DiaryEntry> getSelectedDayMealEntries({required Meal meal}) =>
      dayMealEntries.value.data?.firstWhereOrNull((mealEntries) => mealEntries.meal == meal)?.diaryEntries.toList() ??
      [];

  bool hasMealEntries({required Meal meal}) => getSelectedDayMealEntries(meal: meal).isNotEmpty;

  void removeDiaryEntrySync({required Meal meal, required DiaryEntry diaryEntry}) {
    var entries = dayMealEntries.value.data?.firstWhere((mealEntries) => mealEntries.meal == meal);
    if (entries == null) {
      return;
    }
    dayMealEntries.value = FutureResponse.success(dayMealEntries.value.data
        ?.map((mealEntriesList) => mealEntriesList.meal == meal
            ? MealEntriesList(
                meal: meal,
                diaryEntries: mealEntriesList.diaryEntries.whereNot((entry) => entry.matches(diaryEntry)).toList())
            : mealEntriesList)
        .toList());

    //TODO: remove from local storage and call the API to delete OR mark as deleted true in local storage

    if (!dayMealEntries.value.data!.any((dayMealEntries) => dayMealEntries.diaryEntries.isNotEmpty)) {
      exitEditMode();
    }
  }

  Future<void> removeSingleDiaryEntry({required Meal meal, required DiaryEntry diaryEntry}) async {
    removeDiaryEntrySync(meal: meal, diaryEntry: diaryEntry);
    if (diaryEntry.collectionId != null) {
      final apiService = await locator.getAsync<CollectionApiService>();
      await apiService.deleteDiaryEntry(diaryEntryId: diaryEntry.collectionId!).then((_) async {
        await _handleLocalDiaryEntryDeleted(diaryEntry);
      }).catchError((error, stackTrace) {
        if (error.isConnectionError) {
          _handleLocalDiaryEntryDeleteFailed(diaryEntry);
        } else {
          locator<LoggingService>().handle(error, stackTrace);
        }
      });
    }
  }

  Future<void> _handleLocalDiaryEntryDeleteFailed(DiaryEntry diaryEntry) async {
    // final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    // TODO: for matching local entry with local id or collection id
    // then mark deleted = true locally
  }

  Future<void> _handleLocalDiaryEntryDeleted(DiaryEntry diaryEntry) async {
    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    if (diaryEntry.localId != null) {
      await diaryEntriesService.deleteDiaryEntries(localEntries: [diaryEntry.localId!]);
    } else if (diaryEntry.collectionId != null) {
      final localDiaryEntry = await diaryEntriesService.getDiaryEntry(collectionId: diaryEntry.collectionId!);
      if (localDiaryEntry == null) {
        await diaryEntriesService.deleteDiaryEntries(localEntries: [localDiaryEntry!.id]);
      } else {
        locator<LoggingService>().info('Skipping delete from local storage for diary entry $diaryEntry');
      }
    } else {
      locator<LoggingService>().info('Skipping delete from local storage for diary entry $diaryEntry');
    }
  }

  Future<List<MealEntriesList>> _mergeRemoteAndLocalDiaries({
    required List<MealEntriesResponse> collectionDiary,
    required String diaryDate,
    required String userId,
  }) async {
    var remoteDiary = collectionDiary.map((mealEntriesResponse) => mealEntriesResponse.mealEntriesList).toList();
    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    final localDisplayDiary = await diaryEntriesService.getDisplayDiaryEntries(
      date: diaryDate,
      filterPending: true,
    );

    unawaited(_pullRemoteDiary(remoteDiary, userId));
    unawaited(_deleteMissingPushedLocalDiaryEntries(remoteDiary, userId));

    var result = <MealEntriesList>[];
    for (final meal in Meal.values) {
      final remoteDiaryEntries = remoteDiary
          .where((list) => list.meal == meal)
          .map((element) => element.diaryEntries)
          .expand((element) => element)
          .toList();
      final localDiaryEntries = localDisplayDiary
          .where((list) => list.meal == meal)
          .map((element) => element.diaryEntries)
          .expand((element) => element)
          .toList();
      result.add(MealEntriesList(
        meal: meal,
        diaryEntries: [
          ...remoteDiaryEntries,
          ...localDiaryEntries,
        ],
      ));
    }
    return result;
  }

  Future<void> _deleteMissingPushedLocalDiaryEntries(List<MealEntriesList> remoteDiary, String userId) async {
    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    final pushedLocalEntries = await diaryEntriesService.getDiaryEntries(filterPushed: true);
    final remoteEntries = remoteDiary.expand((mealEntriesList) => mealEntriesList.diaryEntries).toList();
    var discardedDiaryEntriesIds = <int>[];
    for (final localEntry in pushedLocalEntries) {
      if (!remoteEntries.any((remoteEntry) => localEntry.entryId == remoteEntry.collectionId)) {
        discardedDiaryEntriesIds.add(localEntry.id);
      }
    }
    diaryEntriesService.deleteDiaryEntries(localEntries: discardedDiaryEntriesIds);
  }

  Future<void> _pullRemoteDiary(List<MealEntriesList> remoteDiary, String userId) async {
    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    final pushedLocalEntries = await diaryEntriesService.getDiaryEntries(filterPushed: true);
    var pulledDiaryEntries = <LocalDiaryEntry>[];
    for (final remoteMealEntriesList in remoteDiary) {
      for (final entry in remoteMealEntriesList.diaryEntries) {
        if (!pushedLocalEntries.any((localEntry) => localEntry.entryId == entry.collectionId)) {
          pulledDiaryEntries.add(LocalDiaryEntry()
            ..entryId = entry.collectionId
            ..meal = remoteMealEntriesList.meal
            ..pushed = true
            ..servingQuantity = entry.servingQuantity
            ..unitId = entry.unitId
            ..entryDate = locator<DateFormattingService>().parse(
              formattedDate: entry.date,
              format: collectionApiDateFormat,
            )
            ..localFood = entry.food.localDiaryFood
            ..userId = userId);
        }
      }
    }
    diaryEntriesService.upsertDiaryEntries(localEntries: pulledDiaryEntries);
  }

  void enterEditMode() => diaryEditModeEnabled.value = true;

  void exitEditMode() {
    diaryEditModeEnabled.value = false;
    checkedDiaryEntries.value = [];
  }

  void onDayCheckChanged({required bool? checked}) {
    if (checked ?? false) {
      checkedDiaryEntries.value = _allMealsDiaryEntries;
    } else {
      checkedDiaryEntries.value = [];
    }
  }

  bool? get isDayChecked {
    if (checkedDiaryEntries.value.isEmpty) {
      return false;
    } else if (checkedDiaryEntries.value.length == _allMealsDiaryEntries.length) {
      return true;
    } else {
      return null;
    }
  }

  bool? isMealChecked({required Meal meal}) {
    final mealEntries =
        dayMealEntries.value.data?.firstWhereOrNull((mealEntriesList) => mealEntriesList.meal == meal)?.diaryEntries ??
            [];
    final mealCheckedEntriesCount = mealEntries
        .where((entry) => checkedDiaryEntries.value.any((checkedEntry) => checkedEntry.matches(entry)))
        .length;
    if (mealCheckedEntriesCount == 0) {
      return false;
    } else if (mealCheckedEntriesCount == mealEntries.length) {
      return true;
    } else {
      return null;
    }
  }

  void onMealCheckChanged({required Meal meal, required bool? checked}) {
    var currentlyChecked = List<DiaryEntry>.from(checkedDiaryEntries.value);
    if (checked ?? false) {
      final newlyChecked = dayMealEntries.value.data
              ?.firstWhereOrNull((mealEntries) => mealEntries.meal == meal)
              ?.diaryEntries
              .whereNot((entry) => currentlyChecked.any((checkedEntry) => checkedEntry.matches(entry)))
              .toList() ??
          [];
      currentlyChecked.addAll(newlyChecked);
    } else {
      final alreadyChecked = dayMealEntries.value.data
              ?.firstWhereOrNull((mealEntries) => mealEntries.meal == meal)
              ?.diaryEntries
              .where((entry) => currentlyChecked.any((checkedEntry) => checkedEntry.matches(entry)))
              .toList() ??
          [];
      currentlyChecked.removeWhere((checkedEntry) => alreadyChecked.any((entry) => checkedEntry.matches(entry)));
    }
    checkedDiaryEntries.value = currentlyChecked;
  }

  void onDiaryEntryCheckChanged({required DiaryEntry entry, required bool? checked}) {
    var currentlyChecked = List<DiaryEntry>.from(checkedDiaryEntries.value);
    if (checked ?? false) {
      currentlyChecked.add(entry);
    } else {
      currentlyChecked.removeWhere((checkedEntry) => checkedEntry.matches(entry));
    }
    checkedDiaryEntries.value = currentlyChecked;
  }

  bool isEntryChecked({required DiaryEntry entry}) =>
      checkedDiaryEntries.value.any((checkedEntry) => checkedEntry.matches(entry));
}
