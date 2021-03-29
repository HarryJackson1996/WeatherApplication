import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/themes/app_themes.dart';
import 'blocs/theme/theme_bloc.dart';
import './utils/router.dart' as MyRouter;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, AppTheme>(
      builder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRouter.Router.generateRoute,
          theme: appThemeData[theme],
        );
      },
    );
  }
}
