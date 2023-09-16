import 'package:dio/dio.dart';

extension DioErrorExtension on DioException {
  bool get isConnectionError =>
      type == DioExceptionType.connectionError || type == DioExceptionType.connectionTimeout || toString().contains('SocketException');
}
