import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'app_themes.g.dart';

@HiveType(typeId: 2)
enum AppTheme {
  @HiveField(0)
  LIGHT,
  @HiveField(1)
  DARK,
}

final appThemeData = {
  AppTheme.DARK: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red,
    ),
  ),
  AppTheme.LIGHT: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
  )
};
