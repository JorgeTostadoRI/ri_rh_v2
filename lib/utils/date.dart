/// Returns a list of days between [from] and [to], inclusive.
List<DateTime> listDaysBetween(DateTime from, DateTime to) {
  assert(!from.isAfter(to));

  final start = from.copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
  final end = to.copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
  final List<DateTime> dates = [];

  DateTime current = start.copyWith();
  while (!current.isAfter(end)) {
    dates.add(current);
    current = current.add(const Duration(days: 1));
  }
  return dates;
}