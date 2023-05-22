import 'dart:io';

import 'package:calorietracker/app/dependency_injection.dart';
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
      hitCacheOnErrorExcept: [HttpStatus.notFound, HttpStatus.unauthorized, HttpStatus.badRequest, HttpStatus.internalServerError],
      policy: CachePolicy.refreshForceCache,
      maxStale: const Duration(days: 7),
      cipher: CacheCipher(
        decrypt: (bytes) async {
          return bytes.toList();
        },
        encrypt: (bytes) async {
          return bytes.toList();
        },
      ),
      keyBuilder: (request) {
        return _keyBuilder(urlPath: request.path, baseUrl: request.baseUrl);
      },
    );
    return DioCacheInterceptor(options: cacheOptions);
  }

  Future<Dio> buildDio({required String baseUrl, Map<String, String> headers = const {}}) async {
    _cacheInterceptor ??= await cacheInterceptor;
    final dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 9), receiveTimeout: const Duration(seconds: 9), baseUrl: baseUrl));
    dio.interceptors.add(_cacheInterceptor!);
    dio.options.headers = headers;
    return dio;
  }

  Future deleteEntry({required String urlPath, required String baseUrl}) async {
    final key = _keyBuilder(urlPath: urlPath, baseUrl: baseUrl);
    await _cacheStore?.delete(key);
  }

  Future clearCachedRequests() async {
    await _cacheStore?.clean();
  }

  String _keyBuilder({required String urlPath, required String baseUrl}) {
    return CacheOptions.defaultCacheKeyBuilder(RequestOptions(path: urlPath, baseUrl: baseUrl));
  }
}
