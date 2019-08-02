abstract class Result<T> {
  factory Result.success(T data) = Success;
  static const loading = const Loading();
  factory Result.error(Exception exception) = Error;
}

class Success<T> implements Result<T> {
  final T data;
  const Success(this.data);
}

class Loading<T> implements Result<T> {
  const Loading();
}

class Error<T> implements Result<T> {
  final Exception exception;
  const Error(this.exception);
}
