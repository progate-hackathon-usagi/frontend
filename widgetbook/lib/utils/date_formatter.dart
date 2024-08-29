import 'package:intl/intl.dart';

class DateFormatter {
  // 例: "AM 6:27"
  static String formatTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('a h:mm');
    return formatter.format(dateTime);
  }
}
