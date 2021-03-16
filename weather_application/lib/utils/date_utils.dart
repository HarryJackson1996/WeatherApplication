import 'package:intl/intl.dart';

class MyDateUtils {
  static String convertUnixToDateString(int unixTime, String dateFormat) {
    var date = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    final formattedDate = DateFormat(dateFormat).format(date);
    return formattedDate.toString();
  }
}
