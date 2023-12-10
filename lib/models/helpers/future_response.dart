sealed class FutureResponse<T> {}

class FutureSuccess<T> extends FutureResponse<T> {
  T data;

  FutureSuccess({required this.data});
}

class FutureError<T> extends FutureResponse<T> {}

class FutureLoading<T> extends FutureResponse<T> {}

class FutureInitialState<T> extends FutureResponse<T> {}
