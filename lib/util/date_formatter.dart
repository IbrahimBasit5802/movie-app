import 'package:intl/intl.dart';

extension DateExtension on String {
  String get toMonthDayYear {
    try {
      var date = DateTime.parse(this);
      var formatter = DateFormat('MMM d, yyyy');
      return formatter.format(date);
    } catch (e) {
      return this;
    }
  }
}
