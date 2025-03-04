import 'package:dio/dio.dart';

extension DioErrorExtension on DioException {
  bool get isConnectionError =>
      type == DioExceptionType.connectionError ||
      type == DioExceptionType.connectionTimeout ||
      type == DioExceptionType.receiveTimeout ||
      type == DioExceptionType.unknown && toString().contains('SocketException');
}
