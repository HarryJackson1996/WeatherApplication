import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void _registerDeviceOrientations() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _registerDeviceOrientations();
  runApp(MyApp());
}
