import 'package:intl/intl.dart';

class MyDateUtils {
  static String unixToDateString(int dateString, String dateFormat) {
    var date = DateTime.fromMillisecondsSinceEpoch(dateString * 1000, isUtc: true).toLocal();
    final formattedDate = DateFormat(dateFormat).format(date);
    return formattedDate.toString();
  }

  static String unixToTimezoneDateString(int dateString, String timezone, String dateFormat) {
    if (timezone == '0') {
      return unixToDateString(dateString, dateFormat);
    } else if (timezone != null) {
      var date = DateTime.fromMillisecondsSinceEpoch(dateString * 1000, isUtc: true).toLocal();
      if (timezone.contains('-')) {
        final formattedDate = DateFormat(dateFormat).format(date.subtractDate(timezone));
        return formattedDate;
      } else {
        final formattedDate = DateFormat(dateFormat).format(date.addDate(timezone));
        return formattedDate;
      }
    } else {
      return '';
    }
  }
}

extension DateExtension on DateTime {
  DateTime addDate(String timezone) {
    return this.add(Duration(seconds: int.parse(timezone)));
  }

  DateTime subtractDate(String timezone) {
    return this.subtract(Duration(seconds: int.parse(timezone).abs()));
  }
}
