import 'package:weather_application/models/settings_model.dart';

class TempUtils {
  static String updateTemp(String temp, TempUnit tempUnit) {
    switch (tempUnit) {
      case TempUnit.CELSIUS:
        return temp;
        break;
      case TempUnit.FAHRENHEIT:
        double fahrenheit = (double.parse(temp) * 1.8) + 32;
        return fahrenheit.toInt().toString();
        break;
      default:
        return temp;
        break;
    }
  }
}
