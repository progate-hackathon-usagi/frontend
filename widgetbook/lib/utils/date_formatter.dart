import 'package:intl/intl.dart';

class DateFormatter {
  static String formatTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('a h:mm');
    return formatter.format(dateTime);
  }
}
