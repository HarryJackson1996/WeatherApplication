import 'package:flutter/material.dart';
import 'blocs/blocs.dart';
import 'package:weather_application/themes/app_themes.dart';
import 'utils/router_utils.dart' as MyRouter;

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
