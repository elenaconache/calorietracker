extension NumericExtension on double? {
  double toPrecision(int precision) {
    if (this == null) return 0;
    return double.parse(this!.toStringAsFixed(precision));
  }
}
