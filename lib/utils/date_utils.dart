import 'package:intl/intl.dart';
import '../utils/extensions/extensions.dart';

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

  static bool timeDifference(int lastUpdated, int difference) {
    var dateTimeWeather = DateTime.fromMillisecondsSinceEpoch(lastUpdated * 1000);
    var dateTimeNow = DateTime.now();
    print(dateTimeNow);
    print(dateTimeWeather);

    print(dateTimeNow.difference(dateTimeWeather).inMinutes);
    if (dateTimeNow.difference(dateTimeWeather).inMinutes.abs() > difference) {
      return true;
    } else {
      return false;
    }
  }
}
