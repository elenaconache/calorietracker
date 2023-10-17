import 'dart:io';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/interceptors/logging_interceptor.dart';
import 'package:calorietracker/providers/app_path_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

class DioProvider {
  CacheStore? _cacheStore;
  DioCacheInterceptor? _cacheInterceptor;

  Future<DioCacheInterceptor> get cacheInterceptor async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    _cacheStore = HiveCacheStore('${pathProvider.path}/cache/api');
    final cacheOptions = CacheOptions(
      store: _cacheStore,
      hitCacheOnErrorExcept: [
        HttpStatus.notFound,
        HttpStatus.unauthorized,
        HttpStatus.badRequest,
      ],
      policy: CachePolicy.refresh,
      maxStale: const Duration(days: 7),
    );
    return DioCacheInterceptor(options: cacheOptions);
  }

  Future<Dio> buildDio({required String baseUrl, Map<String, String> headers = const {}}) async {
    _cacheInterceptor ??= await cacheInterceptor;
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 2),
      baseUrl: baseUrl,
    ));
    dio.interceptors.add(_cacheInterceptor!);
    dio.interceptors.add(locator<LoggingInterceptor>());
    dio.options.headers = headers;
    return dio;
  }
}
