extension DateTimeExt on DateTime {
  DateTime get yesterday => subtract(const Duration(days: 1));
  DateTime get tomorrow => add(const Duration(days: 1));
  DateTime get previousMonth => subtract(const Duration(days: 31));
  DateTime get nextMonth => add(const Duration(days: 31));
}
