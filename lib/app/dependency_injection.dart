import 'package:calorietracker/features/food_search/food_search_controller.dart';
import 'package:calorietracker/providers/app_path_provider.dart';
import 'package:calorietracker/providers/dio_provider.dart';
import 'package:calorietracker/service/date_formatting_service.dart';
import 'package:calorietracker/service/diary_service.dart';
import 'package:calorietracker/service/nutritionix_api_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

const _nutritionixApiBaseUrl = 'https://trackapi.nutritionix.com/';

void setupLocator() {
  locator.registerLazySingleton<DateFormattingService>(() => DateFormattingService());
  locator.registerLazySingleton<DiaryService>(() => DiaryService());
  locator.registerLazySingleton<DioProvider>(() => DioProvider());

  locator.registerLazySingletonAsync<AppPathProvider>(() async {
    final appPathProvider = AppPathProvider();
    await appPathProvider.initPath();
    return appPathProvider;
  });
  locator.registerLazySingletonAsync<NutritionixApiService>(() async {
    return NutritionixApiService(await locator<DioProvider>().buildDio(baseUrl: _nutritionixApiBaseUrl, headers: {
      'x-app-id': 'f8384da2', //TODO: store in environment variable using dotenv
      'x-app-key': '26f2d40ca353d5ece308c4db6b5d0c52'
    }));
  });

  locator.registerFactory<FoodSearchController>(() => FoodSearchController());
}
