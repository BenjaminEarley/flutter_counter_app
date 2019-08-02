class UnsupportedException implements Exception {
  final String message;
  const UnsupportedException([this.message = ""]);
  String toString() => "UnsupportedException: $message";
}