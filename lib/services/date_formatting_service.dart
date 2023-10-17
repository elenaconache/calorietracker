import 'package:intl/intl.dart';

const calendarFormat = 'MM/dd/yy';
const collectionApiDateFormat = 'yyyy-MM-dd';

class DateFormattingService {
  String format({required String dateTime, String format = calendarFormat}) =>
      DateFormat(format).format(DateTime.parse(dateTime));

  DateTime parse({required String formattedDate, String format = calendarFormat}) =>
      DateFormat(format).parse(formattedDate);
}
