extension ExtendedDateTime on DateTime {
  /// Returns the date in YYYY-MM-DD format.
  String toShortIsoString() {
    final paddedMonth = month.toString().padLeft(2, '0');
    final paddedDay = day.toString().padLeft(2, '0');
    return '$year-$paddedMonth-$paddedDay';
  }

  /// Returns whether this date is in the same day of the year as [other].
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}