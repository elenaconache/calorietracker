import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioProvider {
  final Dio dio;

  DioProvider(this.dio);

  @factoryMethod
  static Future<DioProvider> buildDio({@factoryParam String? baseUrl, @factoryParam Map<String, String>? headers}) async {
    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
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
