import 'package:intl/intl.dart';

class FormatDates {
  String dateFormatShortMonthDayYear(String date) {
    return DateFormat.yMMMd().format(DateTime.parse(date));
  }
}