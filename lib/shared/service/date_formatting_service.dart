import 'package:calorietracker/ui/app_strings.dart';
import 'package:intl/intl.dart';

const calendarFormat = 'MM/dd/yy';
const collectionApiDateFormat = 'yyyy-MM-dd';
const userFormat = 'EEE, MMMM d';

class DateFormattingService {
  String format({required String dateTime, String format = calendarFormat}) =>
      DateFormat(format).format(DateTime.parse(dateTime));

  DateTime parse({required String formattedDate, String format = calendarFormat}) =>
      DateFormat(format).parse(formattedDate);

  String formatUserFriendly({required String dateTime}) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final dateToCheck = DateTime.parse(dateTime);
    final calendarDateToCheck = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);

    if (calendarDateToCheck == today) {
      return AppStrings.todayTitle;
    } else if (calendarDateToCheck == yesterday) {
      return AppStrings.yesterdayLabel;
    } else if (calendarDateToCheck == tomorrow) {
      return AppStrings.tomorrowLabel;
    } else {
      return format(dateTime: dateTime, format: userFormat);
    }
  }
}
