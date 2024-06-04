import 'package:intl/intl.dart';

String formatDateToString(DateTime date) {
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = date.year.toString();

  return '$day.$month.$year';
}

List<String> getDayAndFormattedDate() {
  // Create a DateFormat object for the full date
  DateFormat dateFormatter = DateFormat('d MMMM, yyyy');
  // Format the date to get the full date string
  final now = DateTime.now();
  String formattedDate = dateFormatter.format(now);

  // Get the day of the week
  String dayOfWeek = DateFormat('EEEE').format(now);

  // Return both the day of the week and the formatted date
  return [dayOfWeek, formattedDate];
}
