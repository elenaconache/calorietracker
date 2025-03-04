import 'package:intl/intl.dart';

class NumericFormattingService {
  String formatDecimals({required double value}) {
    final formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;
    return formatter.format(value);
  }
}
