import 'dart:io';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/providers/app_path_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioProvider {
  final Dio dio;

  DioProvider(this.dio);

  @factoryMethod
  static Future<DioProvider> buildDio({@factoryParam String? baseUrl, @factoryParam Map<String, String>? headers}) async {
    final pathProvider = getIt.get<AppPathProvider>();
    final cacheStore = HiveCacheStore('${pathProvider.path}/cache/api');
    final cacheOptions = CacheOptions(
      store: cacheStore,
      hitCacheOnErrorExcept: [
        HttpStatus.notFound,
        HttpStatus.unauthorized,
        HttpStatus.badRequest,
      ],
      policy: CachePolicy.refresh,
      maxStale: const Duration(days: 7),
    );
    final cacheInterceptor = DioCacheInterceptor(options: cacheOptions);
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 9),
      receiveTimeout: const Duration(seconds: 9),
      baseUrl: baseUrl ?? '',
    ));
    dio.interceptors.add(cacheInterceptor);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    dio.options.headers = headers ?? {};
    return DioProvider(dio);
  }
}
