// dart format width=80
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
import 'package:rxdart/rxdart.dart' as _i430;
import 'package:rxdart/subjects.dart' as _i222;

import '../../feature/add_food/logic/add_food_cubit.dart' as _i980;
import '../../feature/auth/domain/auth_repository.dart' as _i566;
import '../../feature/auth/logic/auth_bloc.dart' as _i128;
import '../../feature/auth/logic/login_cubit.dart' as _i867;
import '../../feature/create_food/logic/create_food_cubit.dart' as _i525;
import '../../feature/diary/logic/diary_bloc.dart' as _i738;
import '../../feature/profile/domain/goals_repository.dart' as _i924;
import '../../feature/profile/logic/user_goals_cubit.dart' as _i98;
import '../../feature/recipes/details/recipe_details_controller.dart' as _i1;
import '../../feature/recipes/logic/create_recipe_controller.dart' as _i169;
import '../../feature/recipes/logic/recipe_helper.dart' as _i412;
import '../../feature/recipes/logic/search_recipe_controller.dart' as _i371;
import '../../feature/search_food/data/search_food_service.dart' as _i383;
import '../../feature/search_food/logic/food_item_controller.dart' as _i264;
import '../../ui/components/dropdown/app_dropdown_button_controller.dart'
    as _i211;
import '../app_environment.dart' as _i1067;
import '../data/model/user.dart' as _i548;
import '../data/providers/app_path_provider.dart' as _i667;
import '../data/providers/dio_provider.dart' as _i159;
import '../data/service/api/collection_api_service.dart' as _i13;
import '../data/service/api/nutritionix_api_service.dart' as _i1017;
import '../data/service/api/user_api_service.dart' as _i376;
import '../data/service/data_sync_service.dart' as _i999;
import '../data/service/database/database_repository.dart' as _i379;
import '../data/service/database/diary_entry_service.dart' as _i373;
import '../data/service/database/diary_logging_service.dart' as _i493;
import '../data/service/database/food_service.dart' as _i271;
import '../data/service/date_formatting_service.dart' as _i443;
import '../data/service/diary_service.dart' as _i615;
import '../data/service/logging_service.dart' as _i861;
import '../data/service/numeric_formatting_service.dart' as _i633;
import '../data/service/secure_storage_service.dart' as _i270;
import '../data/validators/food_validator.dart' as _i404;
import '../data/validators/nutrition_validator.dart' as _i2;
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
    gh.factory<_i222.BehaviorSubject<_i548.User?>>(
        () => registerModule.selectedUserController);
    gh.factoryAsync<_i1067.AppEnvironment>(
        () => _i1067.AppEnvironment.create());
    gh.factory<_i2.NutritionValidator>(() => _i2.NutritionValidator());
    gh.factory<_i404.FoodValidator>(() => _i404.FoodValidator());
    gh.factory<_i443.DateFormattingService>(
        () => _i443.DateFormattingService());
    gh.factory<_i633.NumericFormattingService>(
        () => _i633.NumericFormattingService());
    gh.factory<_i270.SecureStorageService>(() => _i270.SecureStorageService());
    gh.factory<_i861.LoggingService>(() => _i861.LoggingService());
    gh.factory<_i867.LoginCubit>(() => _i867.LoginCubit());
    gh.factory<_i371.SearchRecipeController>(
        () => _i371.SearchRecipeController());
    gh.factory<_i169.CreateRecipeController>(
        () => _i169.CreateRecipeController());
    gh.factory<_i412.RecipeHelper>(() => _i412.RecipeHelper());
    gh.factory<_i1.RecipeDetailsController>(
        () => _i1.RecipeDetailsController());
    gh.factory<_i738.DiaryBloc>(() => _i738.DiaryBloc());
    gh.factory<_i525.CreateFoodCubit>(() => _i525.CreateFoodCubit());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    gh.lazySingletonAsync<_i1017.NutritionixApiService>(
        () => registerModule.nutritionixApiService);
    await gh.lazySingletonAsync<_i667.AppPathProvider>(
      () {
        final i = _i667.AppPathProvider();
        return i.initPath().then((_) => i);
      },
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i379.DatabaseRepository>(
      () {
        final i = _i379.DatabaseRepository();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i383.SearchFoodService>(() => _i383.SearchFoodService());
    gh.lazySingleton<_i271.FoodService>(
        () => _i271.FoodService(database: gh<_i379.DatabaseRepository>()));
    gh.lazySingleton<_i566.AuthRepository>(() => _i566.AuthRepository(
          gh<_i270.SecureStorageService>(),
          gh<_i861.LoggingService>(),
          gh<_i430.BehaviorSubject<_i548.User?>>(),
          gh<_i376.UserApiService>(),
        ));
    gh.factoryAsync<String>(
      () => registerModule.appDirectoryPath,
      instanceName: 'appDirectoryPath',
    );
    gh.factoryParam<_i159.DioProvider, String?, Map<String, String>?>((
      baseUrl,
      headers,
    ) =>
        _i159.DioProvider(
          baseUrl: baseUrl,
          headers: headers,
        ));
    gh.factory<_i264.FoodItemController>(
        () => _i264.FoodItemController(gh<_i566.AuthRepository>()));
    gh.lazySingleton<_i493.DiaryLoggingService>(
        () => _i493.DiaryLoggingService(gh<_i566.AuthRepository>()));
    gh.lazySingleton<_i373.DiaryEntryService>(() => _i373.DiaryEntryService(
          gh<_i379.DatabaseRepository>(),
          gh<_i566.AuthRepository>(),
        ));
    gh.factory<_i924.GoalsRepository>(
        () => _i924.GoalsRepository(gh<_i270.SecureStorageService>()));
    gh.lazySingleton<_i615.DiaryService>(() => _i615.DiaryService(
          gh<_i566.AuthRepository>(),
          gh<_i443.DateFormattingService>(),
          gh<_i861.LoggingService>(),
          gh<_i13.CollectionApiService>(),
          gh<_i373.DiaryEntryService>(),
        ));
    gh.lazySingleton<_i999.DataSyncService>(() => _i999.DataSyncService(
          gh<_i373.DiaryEntryService>(),
          gh<_i13.CollectionApiService>(),
          gh<_i861.LoggingService>(),
          gh<_i271.FoodService>(),
        ));
    gh.factory<_i980.AddFoodCubit>(() => _i980.AddFoodCubit(
          gh<_i566.AuthRepository>(),
          gh<_i861.LoggingService>(),
          gh<_i615.DiaryService>(),
          gh<_i493.DiaryLoggingService>(),
          gh<_i13.CollectionApiService>(),
          gh<_i271.FoodService>(),
        ));
    gh.factory<_i128.AuthBloc>(() => _i128.AuthBloc(
          gh<_i566.AuthRepository>(),
          gh<_i861.LoggingService>(),
          gh<_i615.DiaryService>(),
        ));
    gh.factory<_i98.UserGoalsCubit>(() => _i98.UserGoalsCubit(
          gh<_i566.AuthRepository>(),
          gh<_i924.GoalsRepository>(),
          gh<_i861.LoggingService>(),
        ));
    await gh.lazySingletonAsync<_i376.UserApiService>(
      () => registerModule.userApiService,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i13.CollectionApiService>(
      () => registerModule.collectionApiService,
      preResolve: true,
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
