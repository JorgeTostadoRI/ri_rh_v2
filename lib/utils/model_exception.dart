class ModelException implements Exception {
  final String message;
  final Map<String, Object?>? context;

  const ModelException(this.message, {this.context});

  @override
  String toString() {
    if (context == null) {
      return message;
    }
    return '$message: $context';
  }
}