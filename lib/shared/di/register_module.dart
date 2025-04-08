import 'package:calorietracker/shared/app_environment.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/data/providers/app_path_provider.dart';
import 'package:calorietracker/shared/data/providers/dio_provider.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/data/service/api/nutritionix_api_service.dart';
import 'package:calorietracker/shared/data/service/api/user_api_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage => FlutterSecureStorage();

  @lazySingleton
  Future<CollectionApiService> get collectionApiService async {
    final baseUrl = (await getIt.getAsync<AppEnvironment>()).getString(key: collectionApiBaseUrlKey);
    final dioProvider = await getIt.getAsync<DioProvider>(param1: baseUrl);
    return CollectionApiService(dioProvider.dio);
  }

  @lazySingleton
  Future<NutritionixApiService> get nutritionixApiService async {
    final env = await getIt.getAsync<AppEnvironment>();
    final baseUrl = env.getString(key: nutritionixApiBaseUrlKey);
    final dioProvider = await getIt.getAsync<DioProvider>(
        param1: baseUrl, param2: {'x-app-id': env.getString(key: nutritionixAppIdKey), 'x-app-key': env.getString(key: nutritionixAppKey)});
    return NutritionixApiService(dioProvider.dio);
  }

  @lazySingleton
  Future<UserApiService> get userApiService async {
    final baseUrl = (await getIt.getAsync<AppEnvironment>()).getString(key: userApiBaseUrlKey);
    final dioProvider = await getIt.getAsync<DioProvider>(param1: baseUrl);
    return UserApiService(dioProvider.dio);
  }

  @Named('appDirectoryPath')
  Future<String> get appDirectoryPath async {
    final provider = await getIt.getAsync<AppPathProvider>();
    return provider.path;
  }
}
