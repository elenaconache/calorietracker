import 'package:dio/dio.dart';

extension DioErrorExtension on DioException {
  bool get isConnectionError => type == DioExceptionType.connectionError || toString().contains('SocketException');
}
