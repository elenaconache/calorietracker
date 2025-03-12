import 'package:calorietracker/feature/add_food/logic/add_food_controller.dart';
import 'package:calorietracker/feature/create_food/logic/create_food_controller.dart';
import 'package:calorietracker/feature/diary/logic/diary_controller.dart';
import 'package:calorietracker/feature/login/logic/login_controller.dart';
import 'package:calorietracker/feature/profile/logic/user_goals_controller.dart';
import 'package:calorietracker/feature/recipes/logic/create_recipe_controller.dart';
import 'package:calorietracker/feature/recipes/details/recipe_details_controller.dart';
import 'package:calorietracker/feature/recipes/logic/recipe_helper.dart';
import 'package:calorietracker/feature/recipes/logic/search_recipe_controller.dart';
import 'package:calorietracker/feature/search_food/logic/food_item_controller.dart';
import 'package:calorietracker/feature/search_food/data/search_food_service.dart';
import 'package:calorietracker/shared/interceptor/logging_interceptor.dart';
import 'package:calorietracker/shared/providers/app_path_provider.dart';
import 'package:calorietracker/shared/providers/dio_provider.dart';
import 'package:calorietracker/shared/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/service/data_sync_service.dart';
import 'package:calorietracker/shared/service/database/database_repository.dart';
import 'package:calorietracker/shared/service/database/diary_logging_service.dart';
import 'package:calorietracker/shared/service/database/food_service.dart';
import 'package:calorietracker/shared/service/database/diary_entry_service.dart';
import 'package:calorietracker/shared/service/date_formatting_service.dart';
import 'package:calorietracker/shared/service/diary_service.dart';
import 'package:calorietracker/shared/service/logging_service.dart';
import 'package:calorietracker/shared/service/numeric_formatting_service.dart';
import 'package:calorietracker/shared/service/api/nutritionix_api_service.dart';
import 'package:calorietracker/shared/service/secure_storage_service.dart';
import 'package:calorietracker/shared/service/api/user_api_service.dart';
import 'package:calorietracker/shared/service/user_service.dart';
import 'package:calorietracker/ui/components/dropdown/app_dropdown_button_controller.dart';
import 'package:calorietracker/validators/food_validator.dart';
import 'package:calorietracker/validators/nutrition_validator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

// TODO: extract collection base url into env variable
const _collectionApiBaseUrl = 'http://192.168.0.29:8081/'; // DEV
// const _collectionApiBaseUrl = 'http://192.168.0.133:8080/calorietracker/';// ACER / PROD
// const _userApiBaseUrl = 'http://192.168.0.133:8080/user/';// ACER / PROD
const _userApiBaseUrl = 'http://192.168.0.29:8082/'; // DEV
const _nutritionixApiBaseUrl = 'https://trackapi.nutritionix.com/';

void setupLocator() {
  locator.registerFactory<AddFoodController>(() => AddFoodController());
  locator.registerFactory<AppDropdownButtonController>(() => AppDropdownButtonController());
  locator.registerFactory<CreateFoodController>(() => CreateFoodController());
  locator.registerFactory<CreateRecipeController>(() => CreateRecipeController());
  locator.registerFactory<DiaryController>(() => DiaryController());
  locator.registerFactory<FoodItemController>(() => FoodItemController());
  locator.registerFactory<LoginController>(() => LoginController());
  locator.registerFactory<RecipeDetailsController>(() => RecipeDetailsController());
  locator.registerFactory<SearchRecipeController>(() => SearchRecipeController());
  locator.registerFactory<UserGoalsController>(() => UserGoalsController());

  locator.registerLazySingleton<DataSyncService>(() => DataSyncService());
  locator.registerLazySingleton<DateFormattingService>(() => DateFormattingService());
  locator.registerLazySingleton<DiaryLoggingService>(() => DiaryLoggingService());
  locator.registerLazySingleton<DiaryService>(() => DiaryService());
  locator.registerLazySingleton<DioProvider>(() => DioProvider());
  locator.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  locator.registerLazySingleton<SearchFoodService>(() => SearchFoodService());
  locator.registerLazySingleton<FoodValidator>(() => FoodValidator());
  locator.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());
  locator.registerLazySingleton<LoggingService>(() => LoggingService());
  locator.registerLazySingleton<NumericFormattingService>(() => NumericFormattingService());
  locator.registerLazySingleton<NutritionValidator>(() => NutritionValidator());
  locator.registerLazySingleton<RecipeHelper>(() => RecipeHelper());
  locator.registerLazySingleton<SecureStorageService>(() => SecureStorageService());
  locator.registerLazySingleton<UserService>(() => UserService());

  locator.registerLazySingletonAsync<AppPathProvider>(() async {
    final appPathProvider = AppPathProvider();
    await appPathProvider.initPath();
    return appPathProvider;
  });
  locator.registerLazySingletonAsync<CollectionApiService>(() async => CollectionApiService(
        await locator<DioProvider>().buildDio(baseUrl: _collectionApiBaseUrl),
      ));
  locator.registerLazySingletonAsync<DatabaseRepository>(
    () async {
      final pathProvider = await locator.getAsync<AppPathProvider>();
      final database = DatabaseRepository();
      await database.init(pathProvider.path);
      return database;
    },
  );
  locator.registerLazySingletonAsync<DiaryEntryService>(() async {
    final database = await locator.getAsync<DatabaseRepository>();
    return DiaryEntryService(databaseRepository: database);
  });
  locator.registerLazySingletonAsync<FoodService>(() async {
    final database = await locator.getAsync<DatabaseRepository>();
    return FoodService(database: database);
  });
  locator.registerLazySingletonAsync<NutritionixApiService>(() async {
    return NutritionixApiService(await locator<DioProvider>().buildDio(baseUrl: _nutritionixApiBaseUrl, headers: {
      'x-app-id': 'f8384da2', //TODO: store in environment variable using dotenv
      'x-app-key': '26f2d40ca353d5ece308c4db6b5d0c52'
    }));
  });
  locator.registerLazySingletonAsync<UserApiService>(() async => UserApiService(
        await locator<DioProvider>().buildDio(baseUrl: _userApiBaseUrl),
      ));
}
