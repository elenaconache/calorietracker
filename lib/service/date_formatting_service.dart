import 'package:intl/intl.dart';

const calendarFormat = 'MM/dd/yy';

class DateFormattingService {
  String format({required String dateTime, String format = calendarFormat}) {
    return DateFormat(format).format(DateTime.parse(
      dateTime,
    ));
  }

  DateTime parse({required String formattedDate, String format = calendarFormat}) {
    return DateFormat(format).parse(formattedDate);
  }
}
