import 'package:calorietracker/features/add_food/add_food_controller.dart';
import 'package:calorietracker/features/food_search/food_search_service.dart';
import 'package:calorietracker/interceptors/logging_interceptor.dart';
import 'package:calorietracker/providers/app_path_provider.dart';
import 'package:calorietracker/providers/dio_provider.dart';
import 'package:calorietracker/service/collection_api_service.dart';
import 'package:calorietracker/service/date_formatting_service.dart';
import 'package:calorietracker/service/diary_service.dart';
import 'package:calorietracker/service/logging_service.dart';
import 'package:calorietracker/service/numeric_formatting_service.dart';
import 'package:calorietracker/service/nutritionix_api_service.dart';
import 'package:calorietracker/ui/components/dropdown/app_dropdown_button_controller.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

// TODO: extract collection base url into env variable
const _collectionApiBaseUrl = 'http://192.168.0.133:8080/calorietracker/';
const _nutritionixApiBaseUrl = 'https://trackapi.nutritionix.com/';

void setupLocator() {
  locator.registerFactory<AddFoodController>(() => AddFoodController());
  locator.registerFactory<AppDropdownButtonController>(() => AppDropdownButtonController());

  locator.registerLazySingleton<DateFormattingService>(() => DateFormattingService());
  locator.registerLazySingleton<DiaryService>(() => DiaryService());
  locator.registerLazySingleton<DioProvider>(() => DioProvider());
  locator.registerLazySingleton<FoodSearchService>(() => FoodSearchService());
  locator.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());
  locator.registerLazySingleton<LoggingService>(() => LoggingService());
  locator.registerLazySingleton<NumericFormattingService>(() => NumericFormattingService());

  locator.registerLazySingletonAsync<AppPathProvider>(() async {
    final appPathProvider = AppPathProvider();
    await appPathProvider.initPath();
    return appPathProvider;
  });
  locator.registerLazySingletonAsync<CollectionApiService>(
      () async => CollectionApiService(await locator<DioProvider>().buildDio(baseUrl: _collectionApiBaseUrl)));
  locator.registerLazySingletonAsync<NutritionixApiService>(() async {
    return NutritionixApiService(await locator<DioProvider>().buildDio(baseUrl: _nutritionixApiBaseUrl, headers: {
      'x-app-id': 'f8384da2', //TODO: store in environment variable using dotenv
      'x-app-key': '26f2d40ca353d5ece308c4db6b5d0c52'
    }));
  });
}
