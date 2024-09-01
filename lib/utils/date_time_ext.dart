extension DateTimeExt on DateTime {
  DateTime get yesterday => subtract(const Duration(days: 1));
  DateTime get tomorrow => add(const Duration(days: 1));
  DateTime get previousMonth => DateTime(year, month - 1, day);
  DateTime get nextMonth => DateTime(year, month + 1, day);
}
