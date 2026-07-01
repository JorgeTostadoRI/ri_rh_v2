extension DateTimeStringExtensions on DateTime {
  String toShortIsoString() {
    final paddedMonth = month.toString().padLeft(2, '0');
    final paddedDay = month.toString().padLeft(2, '0');
    return '$year-$paddedMonth-$paddedDay';
  }
}