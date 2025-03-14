// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/add_food/logic/add_food_controller.dart' as _i247;
import '../../feature/create_food/logic/create_food_controller.dart' as _i816;
import '../../feature/diary/logic/diary_controller.dart' as _i425;
import '../../feature/login/logic/login_controller.dart' as _i508;
import '../../feature/profile/logic/user_goals_controller.dart' as _i517;
import '../../feature/recipes/details/recipe_details_controller.dart' as _i1;
import '../../feature/recipes/logic/create_recipe_controller.dart' as _i169;
import '../../feature/recipes/logic/recipe_helper.dart' as _i412;
import '../../feature/recipes/logic/search_recipe_controller.dart' as _i371;
import '../../feature/search_food/data/search_food_service.dart' as _i383;
import '../../feature/search_food/logic/food_item_controller.dart' as _i264;
import '../../ui/components/dropdown/app_dropdown_button_controller.dart'
    as _i211;
import '../../validators/food_validator.dart' as _i815;
import '../../validators/nutrition_validator.dart' as _i424;
import '../app_environment.dart' as _i1067;
import '../providers/app_path_provider.dart' as _i543;
import '../providers/dio_provider.dart' as _i548;
import '../service/api/collection_api_service.dart' as _i79;
import '../service/api/nutritionix_api_service.dart' as _i814;
import '../service/api/user_api_service.dart' as _i338;
import '../service/data_sync_service.dart' as _i519;
import '../service/database/database_repository.dart' as _i774;
import '../service/database/diary_entry_service.dart' as _i80;
import '../service/database/diary_logging_service.dart' as _i970;
import '../service/database/food_service.dart' as _i994;
import '../service/date_formatting_service.dart' as _i226;
import '../service/diary_service.dart' as _i929;
import '../service/logging_service.dart' as _i894;
import '../service/numeric_formatting_service.dart' as _i808;
import '../service/secure_storage_service.dart' as _i142;
import '../service/user_service.dart' as _i193;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i211.AppDropdownButtonController>(
        () => _i211.AppDropdownButtonController());
    gh.factoryAsync<_i1067.AppEnvironment>(
        () => _i1067.AppEnvironment.create());
    gh.factory<_i226.DateFormattingService>(
        () => _i226.DateFormattingService());
    gh.factory<_i808.NumericFormattingService>(
        () => _i808.NumericFormattingService());
    gh.factory<_i142.SecureStorageService>(() => _i142.SecureStorageService());
    gh.factory<_i894.LoggingService>(() => _i894.LoggingService());
    gh.factory<_i264.FoodItemController>(() => _i264.FoodItemController());
    gh.factory<_i517.UserGoalsController>(() => _i517.UserGoalsController());
    gh.factory<_i371.SearchRecipeController>(
        () => _i371.SearchRecipeController());
    gh.factory<_i169.CreateRecipeController>(
        () => _i169.CreateRecipeController());
    gh.factory<_i412.RecipeHelper>(() => _i412.RecipeHelper());
    gh.factory<_i1.RecipeDetailsController>(
        () => _i1.RecipeDetailsController());
    gh.factory<_i425.DiaryController>(() => _i425.DiaryController());
    gh.factory<_i816.CreateFoodController>(() => _i816.CreateFoodController());
    gh.factory<_i508.LoginController>(() => _i508.LoginController());
    gh.factory<_i247.AddFoodController>(() => _i247.AddFoodController());
    gh.factory<_i424.NutritionValidator>(() => _i424.NutritionValidator());
    gh.factory<_i815.FoodValidator>(() => _i815.FoodValidator());
    await gh.lazySingletonAsync<_i543.AppPathProvider>(
      () {
        final i = _i543.AppPathProvider();
        return i.initPath().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i929.DiaryService>(() => _i929.DiaryService());
    await gh.lazySingletonAsync<_i774.DatabaseRepository>(
      () {
        final i = _i774.DatabaseRepository();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i970.DiaryLoggingService>(
        () => _i970.DiaryLoggingService());
    gh.lazySingleton<_i519.DataSyncService>(() => _i519.DataSyncService());
    gh.lazySingleton<_i193.UserService>(() => _i193.UserService());
    gh.lazySingleton<_i383.SearchFoodService>(() => _i383.SearchFoodService());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    gh.lazySingletonAsync<_i79.CollectionApiService>(
        () => registerModule.collectionApiService);
    gh.lazySingletonAsync<_i814.NutritionixApiService>(
        () => registerModule.nutritionixApiService);
    gh.lazySingletonAsync<_i338.UserApiService>(
        () => registerModule.userApiService);
    gh.lazySingleton<_i80.DiaryEntryService>(() => _i80.DiaryEntryService(
        databaseRepository: gh<_i774.DatabaseRepository>()));
    gh.factoryAsync<String>(
      () => registerModule.appDirectoryPath,
      instanceName: 'appDirectoryPath',
    );
    gh.factoryParamAsync<_i548.DioProvider, String?, Map<String, String>?>((
      baseUrl,
      headers,
    ) =>
        _i548.DioProvider.buildDio(
          baseUrl: baseUrl,
          headers: headers,
        ));
    gh.lazySingleton<_i994.FoodService>(
        () => _i994.FoodService(database: gh<_i774.DatabaseRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
