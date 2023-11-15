import 'dart:async';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/extensions/dio_extensions.dart';
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
import 'package:dio/dio.dart';
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

    if (!dayMealEntries.value.data!.any((dayMealEntries) => dayMealEntries.diaryEntries.isNotEmpty)) {
      exitEditMode();
    }
  }

  void _removeCheckedDiaryEntriesSync() {
    if (checkedDiaryEntries.value.isEmpty) {
      return;
    }
    dayMealEntries.value = FutureResponse.success(dayMealEntries.value.data
            ?.map((mealEntriesList) => MealEntriesList(
                meal: mealEntriesList.meal,
                diaryEntries: mealEntriesList.diaryEntries
                    .whereNot((entry) => checkedDiaryEntries.value.any(
                          (diaryEntry) => entry.matches(diaryEntry),
                        ))
                    .toList()))
            .toList() ??
        []);
    exitEditMode();
  }

  Future<void> removeSingleDiaryEntry({required Meal meal, required DiaryEntry diaryEntry}) async {
    removeDiaryEntrySync(meal: meal, diaryEntry: diaryEntry);
    if (diaryEntry.collectionId != null) {
      final apiService = await locator.getAsync<CollectionApiService>();
      await apiService.deleteDiaryEntry(diaryEntryId: diaryEntry.collectionId!).then((_) async {
        await _deleteLocalDiaryEntry(diaryEntry);
      }).catchError((error, stackTrace) async {
        if (error is DioException && error.isConnectionError) {
          await _markLocalDiaryEntryDeleted(diaryEntry);
        } else {
          locator<LoggingService>().handle(error, stackTrace);
        }
      });
    } else if (diaryEntry.localId != null) {
      await _markLocalDiaryEntryDeleted(diaryEntry);
    }
  }

  Future<void> removeCheckedDiaryEntries() async {
    if (checkedDiaryEntries.value.isEmpty) {
      return;
    }
    final remoteDiaryEntries = checkedDiaryEntries.value.where((entry) => entry.collectionId != null);
    final pendingDiaryEntries = checkedDiaryEntries.value.where((entry) => entry.collectionId == null);

    _removeCheckedDiaryEntriesSync();

    final apiService = await locator.getAsync<CollectionApiService>();
    await apiService
        .deleteDiaryEntries(ids: remoteDiaryEntries.map((entry) => entry.collectionId!).toList())
        .then((_) async {
      await _deleteLocalDiaryEntries([...remoteDiaryEntries, ...pendingDiaryEntries]);
    }).catchError((error, stackTrace) async {
      if (error is DioException && error.isConnectionError) {
        await _markLocalDiaryEntriesDeleted(remoteDiaryEntries.toList());
      }
      locator<LoggingService>().handle(error, stackTrace);
      await _deleteLocalDiaryEntries(pendingDiaryEntries.toList());
    });
  }

  Future<void> _markLocalDiaryEntryDeleted(DiaryEntry diaryEntry) async {
    final diaryEntryService = await locator.getAsync<DiaryEntryService>();
    var localDiaryEntry = await diaryEntryService.getDiaryEntry(
      collectionId: diaryEntry.collectionId,
      localDiaryEntryId: diaryEntry.localId,
    );
    if (localDiaryEntry != null) {
      localDiaryEntry.deletedEntry = true;
      await diaryEntryService.upsertDiaryEntry(localDiaryEntry: localDiaryEntry);
    }
  }

  //TODO: might also need to filter diary entries everywhere by currently connected user id
  Future<void> _markLocalDiaryEntriesDeleted(List<DiaryEntry> entries) async {
    final diaryEntryService = await locator.getAsync<DiaryEntryService>();
    var localEntries = await diaryEntryService.getDiaryEntriesByIds(
      entries: entries,
    );
    if (localEntries.length != entries.length) {
      locator<LoggingService>().info('Could not find all diary entries in local database. '
          'Might not be able to delete some of the checked entries. '
          'Checked: ${entries.length}, found: ${localEntries.length}.');
    }
    if (localEntries.isNotEmpty) {
      final updatedEntries = localEntries.map((entry) => entry..deletedEntry = true).toList();
      await diaryEntryService.upsertDiaryEntries(localEntries: updatedEntries);
    }
  }

  Future<void> _deleteLocalDiaryEntries(List<DiaryEntry> entries) async {
    final diaryEntryService = await locator.getAsync<DiaryEntryService>();
    var localEntries = await diaryEntryService.getDiaryEntriesByIds(
      entries: entries,
    );
    if (localEntries.isEmpty) {
      return;
    }

    await diaryEntryService.deleteDiaryEntries(
      localEntries: localEntries.map((localEntry) => localEntry.localId).toList(),
    );
  }

  Future<void> _deleteLocalDiaryEntry(DiaryEntry diaryEntry) async {
    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    if (diaryEntry.localId != null) {
      await diaryEntriesService.deleteDiaryEntries(localEntries: [diaryEntry.localId!]);
    } else if (diaryEntry.collectionId != null) {
      final localDiaryEntry = await diaryEntriesService.getDiaryEntry(collectionId: diaryEntry.collectionId!);
      if (localDiaryEntry != null) {
        await diaryEntriesService.deleteDiaryEntries(localEntries: [localDiaryEntry.localId]);
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
    final pushedLocalEntries = await diaryEntriesService.getDiaryEntries(filterPushed: true, excludeDeleted: true);
    final remoteEntries = remoteDiary.expand((mealEntriesList) => mealEntriesList.diaryEntries).toList();
    var discardedDiaryEntriesIds = <int>[];
    for (final localEntry in pushedLocalEntries) {
      if (!remoteEntries.any((remoteEntry) => localEntry.entryId == remoteEntry.collectionId)) {
        discardedDiaryEntriesIds.add(localEntry.localId);
      }
    }
    if (discardedDiaryEntriesIds.isNotEmpty) {
      await diaryEntriesService.deleteDiaryEntries(localEntries: discardedDiaryEntriesIds);
    }
  }

  Future<void> _pullRemoteDiary(List<MealEntriesList> remoteDiary, String userId) async {
    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    final pushedLocalEntries = await diaryEntriesService.getDiaryEntries(filterPushed: true);
    var pulledDiaryEntries = <LocalDiaryEntry>[];
    for (final remoteMealEntriesList in remoteDiary) {
      for (final entry in remoteMealEntriesList.diaryEntries) {
        if (!pushedLocalEntries.any((localEntry) => localEntry.entryId == entry.collectionId)) {
          pulledDiaryEntries.add(
            LocalDiaryEntry()
              ..entryId = entry.collectionId
              ..meal = remoteMealEntriesList.meal
              ..pushedEntry = true
              ..servingQuantity = entry.servingQuantity
              ..unitId = entry.unitId
              ..entryDate = locator<DateFormattingService>().parse(
                formattedDate: entry.date,
                format: collectionApiDateFormat,
              )
              ..localFood.value = entry.food.localFood
              ..userId = userId
              ..deletedEntry = false
              ..errorPushingEntry = false,
          );
        }
      }
    }
    if (pulledDiaryEntries.isNotEmpty) {
      diaryEntriesService.upsertDiaryEntries(localEntries: pulledDiaryEntries, pushFoods: true);
    }
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
