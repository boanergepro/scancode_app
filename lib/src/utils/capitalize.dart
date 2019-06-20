String capitalize(String value) {
  String key = value.substring(0, 1);
  return '${key.toUpperCase()}${value.substring(1)}';
}
