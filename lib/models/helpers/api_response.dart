import 'package:calorietracker/models/helpers/api_response_status.dart';

class ApiResponse<T> {
  ApiResponseStatus? status;
  T? data;
  String? message;

  ApiResponse.loading() : status = ApiResponseStatus.loading;

  ApiResponse.success(this.data) : status = ApiResponseStatus.success;

  ApiResponse.error({this.message = ''}) : status = ApiResponseStatus.error;

  @override
  String toString() {
    return "Status : $status\nMessage : $message\nData : $data";
  }
}
