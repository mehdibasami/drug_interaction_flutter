abstract class ResponseState<T>{
  final T? data;
  final String? error;

  const ResponseState(this.data, this.error);
}

class ResponseSuccess<T> extends ResponseState<T>{
  const ResponseSuccess(T data) : super(data, null);
}

class ResponseFailed<T> extends ResponseState<T>{
  const ResponseFailed(String error) : super(null, error);
}