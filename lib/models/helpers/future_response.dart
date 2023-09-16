import 'package:calorietracker/models/helpers/future_response_status.dart';

class FutureResponse<T> {
  FutureResponseStatus? status;
  T? data;
  String? message;

  FutureResponse.loading() : status = FutureResponseStatus.loading;

  FutureResponse.success(this.data) : status = FutureResponseStatus.success;

  FutureResponse.error({this.message = ''}) : status = FutureResponseStatus.error;

  @override
  String toString() {
    return "Status : $status\nMessage : $message\nData : $data";
  }
}
