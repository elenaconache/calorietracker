import 'package:dio/dio.dart';

extension DioErrorExtension on DioError {
  bool get isConnectionError => type == DioErrorType.connectionError || toString().contains('SocketException');
}
