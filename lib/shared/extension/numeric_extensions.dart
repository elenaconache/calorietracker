extension NumericExtension on double? {
  double toPrecision(int precision) {
    if (this == null) return 0;
    return (this! * 100).round() / 100;
  }
}
