import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final logger = locator<LoggingService>();
    logger.info('*** onRequest - START ***');

    logger.info('URL: ${options.uri}');
    logger.info('METHOD: ${options.method}');
    logger.info('HEADERS:');
    options.headers.forEach((key, v) => logger.info(' - $key: $v'));
    logger.info('BODY:');
    logger.info(options.data?.toString() ?? '');

    logger.info('*** onRequest - END ***');

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final logger = locator<LoggingService>();
    logger.info('*** onError - START ***:');

    logger.info('URI: ${err.requestOptions.uri}');
    if (err.response != null) {
      logger.info('STATUS CODE: ${err.response?.statusCode?.toString()}');
    }
    logger.info('$err');
    if (err.response != null) {
      logger.info('HEADERS:');
      err.response!.requestOptions.headers.forEach((key, v) => logger.info(' - $key: $v'));
      logger.info('REDIRECT: ${err.response?.realUri ?? ''}');
      logger.info('BODY:');
      logger.info(err.response?.data.toString());
    }

    logger.info('*** onError - END ***:');
    return handler.next(err);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    final logger = locator<LoggingService>();
    logger.info('*** onResponse - START ***');

    logger.info('URI: ${response.requestOptions.uri}');
    logger.info('STATUS CODE: ${response.statusCode ?? ''}');
    logger.info('REDIRECT: ${response.isRedirect}');
    logger.info('BODY:');
    logger.info(response.data.toString());

    logger.info('*** onResponse - END ***');

    return handler.next(response);
  }
}
