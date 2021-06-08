import 'package:intl/intl.dart';

class DateHelper {
  const DateHelper._();

  static final _dateFormat = DateFormat('dd/MM/yyyy');
  static final _weekdayFormat = DateFormat('EEEE');

  static String format(DateTime date) {
    return _dateFormat.format(date);
  }

  static DateTime parse(String text) {
    return DateTime.parse(text);
  }

  static String text2Date(String text) {
    final date = parse(text);
    return format(date);
  }

  static String getWeekday(DateTime date) {
    return _weekdayFormat.format(date);
  }

  static int convertYearTo4Digits(int year) {
    final now = DateTime.now();
    final currentYear = now.year.toString();
    final prefix = currentYear.substring(0, currentYear.length - 2);
    return int.parse('$prefix${year.toString().padLeft(2, '0')}');
  }

  static DateTime convertToDateTime(String expiryDate) {
    final values = expiryDate.split('/');
    final month = int.parse(values[0]);
    final year = int.parse(values[1]);
    final now = DateTime.now();
    return DateTime(convertYearTo4Digits(year), month, now.day);
  }

  static bool hasDateExpired(String date) {
    if (date.length != 5) {
      return true;
    } else if (int.parse(date.split('/')[0]) > 12 ||
        int.parse(date.split('/')[0]) < 1) return true;
    final expiryDate = convertToDateTime(date);
    final today = DateTime.now();
    final now = DateTime(today.year, today.month, today.day);
    return expiryDate.isBefore(now);
  }
}
