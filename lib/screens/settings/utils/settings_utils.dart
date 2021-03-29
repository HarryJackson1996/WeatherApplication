import 'package:weather_application/utils/extensions/extensions.dart';

class SettingsUtils {
  static String convert(String value) {
    String text = value.substring(value.indexOf('.') + 1, value.length);
    return text.unCapitalise();
  }

  static int getValue(dynamic target, dynamic myEnum) {
    if (target == myEnum) {
      return 0;
    } else if (target == myEnum) {
      return 0;
    } else {
      return 1;
    }
  }
}
