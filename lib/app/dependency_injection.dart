import 'package:calorietracker/features/add_food/add_food_controller.dart';
import 'package:calorietracker/features/create_food/create_food_controller.dart';
import 'package:calorietracker/features/diary/diary_controller.dart';
import 'package:calorietracker/features/login/login_controller.dart';
import 'package:calorietracker/features/recipes/create_recipe/create_recipe_controller.dart';
import 'package:calorietracker/features/recipes/details/recipe_details_controller.dart';
import 'package:calorietracker/features/recipes/search_recipe_controller.dart';
import 'package:calorietracker/features/search_food/search_food_service.dart';
import 'package:calorietracker/interceptors/logging_interceptor.dart';
import 'package:calorietracker/providers/app_path_provider.dart';
import 'package:calorietracker/providers/dio_provider.dart';
import 'package:calorietracker/services/api/collection_api_service.dart';
import 'package:calorietracker/services/data_sync_service.dart';
import 'package:calorietracker/services/database/database_provider.dart';
import 'package:calorietracker/services/database/food_service.dart';
import 'package:calorietracker/services/database/diary_entry_service.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/numeric_formatting_service.dart';
import 'package:calorietracker/services/api/nutritionix_api_service.dart';
import 'package:calorietracker/services/secure_storage_service.dart';
import 'package:calorietracker/services/api/user_api_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:calorietracker/ui/components/dropdown/app_dropdown_button_controller.dart';
import 'package:calorietracker/validators/food_validator.dart';
import 'package:calorietracker/validators/nutrition_validator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

// TODO: extract collection base url into env variable
const _collectionApiBaseUrl = 'http://192.168.0.93:8080/'; // MAC / DEV
// const _collectionApiBaseUrl = 'http://192.168.0.133:8080/calorietracker/';// ACER / PROD
// const _collectionApiBaseUrl = 'http://192.168.0.133:8080/user/';// ACER / PROD
const _userApiBaseUrl = 'http://192.168.0.93:8082/';
const _nutritionixApiBaseUrl = 'https://trackapi.nutritionix.com/';

void setupLocator() {
  locator.registerFactory<AddFoodController>(() => AddFoodController());
  locator.registerFactory<AppDropdownButtonController>(() => AppDropdownButtonController());
  locator.registerFactory<CreateFoodController>(() => CreateFoodController());
  locator.registerFactory<CreateRecipeController>(() => CreateRecipeController());
  locator.registerFactory<DiaryController>(() => DiaryController());
  locator.registerFactory<LoginController>(() => LoginController());
  locator.registerFactory<RecipeDetailsController>(() => RecipeDetailsController());
  locator.registerFactory<SearchRecipeController>(() => SearchRecipeController());

  locator.registerLazySingleton<DataSyncService>(() => DataSyncService());
  locator.registerLazySingleton<DateFormattingService>(() => DateFormattingService());
  locator.registerLazySingleton<DiaryService>(() => DiaryService());
  locator.registerLazySingleton<DioProvider>(() => DioProvider());
  locator.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  locator.registerLazySingleton<SearchFoodService>(() => SearchFoodService());
  locator.registerLazySingleton<FoodValidator>(() => FoodValidator());
  locator.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());
  locator.registerLazySingleton<LoggingService>(() => LoggingService());
  locator.registerLazySingleton<NumericFormattingService>(() => NumericFormattingService());
  locator.registerLazySingleton<NutritionValidator>(() => NutritionValidator());
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
  locator.registerLazySingletonAsync<DatabaseProvider>(() async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    return DatabaseProvider(path: pathProvider.path);
  });
  locator.registerLazySingletonAsync<DiaryEntryService>(() async {
    final databaseProvider = await locator.getAsync<DatabaseProvider>();
    return DiaryEntryService(database: await databaseProvider.database);
  });
  locator.registerLazySingletonAsync<FoodService>(() async {
    final databaseProvider = await locator.getAsync<DatabaseProvider>();
    return FoodService(database: await databaseProvider.database);
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
