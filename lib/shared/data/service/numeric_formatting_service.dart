import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
class NumericFormattingService {
  String formatDecimals({required double value}) {
    final formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;
    return formatter.format(value);
  }
}
