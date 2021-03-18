import 'package:connectivity/connectivity.dart';

class ConnectivityUtils {
  static Future<bool> hasConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        return true;
        break;
      case ConnectivityResult.none:
        return false;
      default:
        return true;
    }
  }
}
