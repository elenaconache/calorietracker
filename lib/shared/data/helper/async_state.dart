import 'package:calorietracker/shared/data/helper/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

@freezed
class AsyncState<T> with _$AsyncState<T> {
  const AsyncState._();

  factory AsyncState({
    required AsyncStatus status,
    T? data,
    Failure? failure,
  }) = _AsyncState<T>;

  factory AsyncState.initial() => AsyncState<T>(status: const AsyncStatus.initial());

  factory AsyncState.loading() => AsyncState<T>(status: const AsyncStatus.loading());

  factory AsyncState.success(T data) => AsyncState<T>(
        status: const AsyncStatus.success(),
        data: data,
      );

  factory AsyncState.failure(Failure failure) => AsyncState<T>(
        status: const AsyncStatus.failure(),
        failure: failure,
      );
}

@freezed
class AsyncStatus with _$AsyncStatus {
  const AsyncStatus._();

  const factory AsyncStatus.initial() = InitialStatus;
  const factory AsyncStatus.loading() = LoadingStatus;
  const factory AsyncStatus.success() = SuccessStatus;
  const factory AsyncStatus.failure() = FailureStatus;
}
