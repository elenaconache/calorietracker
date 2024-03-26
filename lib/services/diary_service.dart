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
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DiaryService {
  final ValueNotifier<FutureResponse<List<MealEntriesList>>> dayMealEntries = ValueNotifier(FutureInitialState());
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

  void selectNextDay() {
    try {
      final selection = DateTime.parse(selectedDay.value).add(const Duration(days: 1));
      final formattedSelection = _dateFormattingService.format(
        dateTime: selection.toString(),
        format: collectionApiDateFormat,
      );
      selectedDay.value = _dateFormattingService.format(
        dateTime: formattedSelection,
        format: collectionApiDateFormat,
      );
      fetchDiary();
    } on FormatException catch (error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
    }
  }

  void selectPreviousDay() {
    try {
      final selection = DateTime.parse(selectedDay.value).subtract(const Duration(days: 1));
      final formattedSelection = _dateFormattingService.format(
        dateTime: selection.toString(),
        format: collectionApiDateFormat,
      );
      selectedDay.value = _dateFormattingService.format(
        dateTime: formattedSelection,
        format: collectionApiDateFormat,
      );
      fetchDiary();
    } on FormatException catch (error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
    }
  }

  Nutrition get selectedDayNutrition {
    final allDiaryEntries = _allMealsDiaryEntries;
    if (allDiaryEntries.isEmpty) {
      return const Nutrition();
    } else {
      return _getTotalNutrition(allDiaryEntries);
    }
  }

  List<DiaryEntry> get _allMealsDiaryEntries => dayMealEntries.value is FutureSuccess<List<MealEntriesList>>
      ? (dayMealEntries.value as FutureSuccess<List<MealEntriesList>>)
          .data
          .expand((mealEntries) => mealEntries.diaryEntries)
          .toList()
      : <DiaryEntry>[];

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
      dateTime: (date ?? DateTime.tryParse(selectedDay.value) ?? DateTime.now()).toString(),
      format: collectionApiDateFormat,
    );
    selectedDay.value = fetchedDate;
    dayMealEntries.value = FutureLoading();
    final apiService = await locator.getAsync<CollectionApiService>();
    final username = locator<UserService>().selectedUser.value?.username;
    if (username?.isEmpty ?? true) {
      // TODO: navigate to login and show error snack bar
    } else {
      final diary = await (apiService.getDiaryEntries(username: username!, date: fetchedDate).then((response) async {
        return _mergeRemoteAndLocalDiaries(collectionDiary: response, diaryDate: fetchedDate, userId: username);
      }).catchError((error, stackTrace) async {
        locator<LoggingService>().handle(error, stackTrace);
        final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
        final localDiary = await diaryEntriesService.getDisplayDiaryEntries(date: fetchedDate);
        return localDiary;
      }));
      dayMealEntries.value = FutureSuccess(data: diary);
    }
  }

  Nutrition getSelectedDayMealNutrients({required Meal meal}) {
    if (dayMealEntries.value is! FutureSuccess<List<MealEntriesList>>) {
      return const Nutrition();
    }
    final entries = _entries;
    final diaryEntries = entries.firstWhereOrNull((mealEntries) => mealEntries.meal == meal)?.diaryEntries;
    if (diaryEntries == null) {
      return const Nutrition();
    } else {
      return _getTotalNutrition(diaryEntries);
    }
  }

  List<MealEntriesList> get _entries => dayMealEntries.value is FutureSuccess<List<MealEntriesList>>
      ? (dayMealEntries.value as FutureSuccess<List<MealEntriesList>>).data
      : [];

  List<DiaryEntry> getSelectedDayMealEntries({required Meal meal}) {
    return _entries.firstWhereOrNull((mealEntries) => mealEntries.meal == meal)?.diaryEntries.toList() ?? [];
  }

  bool hasMealEntries({required Meal meal}) => getSelectedDayMealEntries(meal: meal).isNotEmpty;

  void removeDiaryEntrySync({required Meal meal, required DiaryEntry diaryEntry}) {
    var entries = _entries.firstWhereOrNull((mealEntries) => mealEntries.meal == meal);
    if (entries == null) {
      return;
    }
    dayMealEntries.value = FutureSuccess(
        data: _entries
            .map((mealEntriesList) => mealEntriesList.meal == meal
                ? MealEntriesList(
                    meal: meal,
                    diaryEntries: mealEntriesList.diaryEntries.whereNot((entry) => entry.matches(diaryEntry)).toList())
                : mealEntriesList)
            .toList());

    if (!_entries.any((dayMealEntries) => dayMealEntries.diaryEntries.isNotEmpty)) {
      exitEditMode();
    }
  }

  void _removeCheckedDiaryEntriesSync() {
    if (checkedDiaryEntries.value.isEmpty) {
      return;
    }
    dayMealEntries.value = FutureSuccess(
        data: _entries
            .map((mealEntriesList) => MealEntriesList(
                meal: mealEntriesList.meal,
                diaryEntries: mealEntriesList.diaryEntries
                    .whereNot((entry) => checkedDiaryEntries.value.any(
                          (diaryEntry) => entry.matches(diaryEntry),
                        ))
                    .toList()))
            .toList());
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
    var remoteDiary = _getMealEntriesList(collectionDiary);
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

  List<MealEntriesList> _getMealEntriesList(List<MealEntriesResponse> collectionDiary) =>
      collectionDiary.map((mealEntriesResponse) => mealEntriesResponse.mealEntriesList).toList();

  Future<void> _deleteMissingPushedLocalDiaryEntries(List<MealEntriesList> remoteDiary, String userId) async {
    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    final pushedLocalEntries = await diaryEntriesService.getDiaryEntries(filterPushed: true, excludeDeleted: true);
    final remoteEntries = remoteDiary.expand((mealEntriesList) => mealEntriesList.diaryEntries).toList();
    var discardedDiaryEntriesIds = <int>[];
    final dateFormattingService = locator<DateFormattingService>();
    final formattedSelectedDay = dateFormattingService.format(
      dateTime: selectedDay.value,
      format: collectionApiDateFormat,
    );
    for (final localEntry in pushedLocalEntries) {
      final localEntryFormattedDate = dateFormattingService.format(
        dateTime: localEntry.entryDate.toString(),
        format: collectionApiDateFormat,
      );
      if (localEntryFormattedDate == formattedSelectedDay &&
          !remoteEntries.any((remoteEntry) => localEntry.entryId == remoteEntry.collectionId)) {
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
            toLocalEntry(entry, remoteMealEntriesList.meal, userId, true),
          );
        }
      }
    }
    if (pulledDiaryEntries.isNotEmpty) {
      diaryEntriesService.upsertDiaryEntries(localEntries: pulledDiaryEntries, pushFoods: true);
    }
  }

  LocalDiaryEntry toLocalEntry(DiaryEntry entry, Meal meal, String userId, bool pushed) => LocalDiaryEntry()
    ..entryId = pushed ? entry.collectionId : null
    ..meal = meal
    ..pushedEntry = pushed
    ..servingQuantity = entry.servingQuantity
    ..unitId = entry.unitId
    ..entryDate = locator<DateFormattingService>().parse(
      formattedDate: entry.date,
      format: collectionApiDateFormat,
    )
    ..localFood.value = entry.food.localFood
    ..username = userId
    ..deletedEntry = false
    ..errorPushingEntry = false;

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
        _entries.firstWhereOrNull((mealEntriesList) => mealEntriesList.meal == meal)?.diaryEntries ?? [];
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
      final newlyChecked = _entries
              .firstWhereOrNull((mealEntries) => mealEntries.meal == meal)
              ?.diaryEntries
              .whereNot((entry) => currentlyChecked.any((checkedEntry) => checkedEntry.matches(entry)))
              .toList() ??
          [];
      currentlyChecked.addAll(newlyChecked);
    } else {
      final alreadyChecked = _entries
              .firstWhereOrNull((mealEntries) => mealEntries.meal == meal)
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

  Future<List<MealEntriesList>> fetchDiaryEntries({required DateTime date, Meal? meal}) async {
    final fetchedDate = _dateFormattingService.format(
      dateTime: date.toString(),
      format: collectionApiDateFormat,
    );
    final apiService = await locator.getAsync<CollectionApiService>();
    final username = locator<UserService>().selectedUser.value?.username;
    if (username?.isEmpty ?? true) {
      return [];
    } else {
      final List<MealEntriesList> diary =
          await (apiService.getDiaryEntries(username: username!, date: fetchedDate).then((response) async {
        return _getMealEntriesList(response);
      }).catchError((error, stackTrace) async {
        locator<LoggingService>().handle(error, stackTrace);

        final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
        final localDisplayDiary = await diaryEntriesService.getDisplayDiaryEntries(date: fetchedDate);
        return localDisplayDiary;
      }));
      return meal == null ? diary : diary.where((mealEntriesList) => mealEntriesList.meal == meal).toList();
    }
  }
}
