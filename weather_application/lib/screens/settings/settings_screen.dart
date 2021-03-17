import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/app.dart';
import 'package:weather_application/blocs/theme/theme_bloc.dart';
import 'package:weather_application/themes/app_themes.dart';

import 'widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
        title: Text(
          'Settings',
          style: GoogleFonts.getFont(
            'Muli',
            textStyle: Theme.of(context).textTheme.headline1,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).buttonColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SettingsItem(
            title: 'Theme',
          )
          // ElevatedButton(
          //   onPressed: () {
          //     BlocProvider.of<ThemeBloc>(context).add(ThemeUpdatedEvent(theme: AppTheme.DARK, id: themeBox));
          //   },
          //   child: Text('Dark'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     BlocProvider.of<ThemeBloc>(context).add(ThemeUpdatedEvent(theme: AppTheme.LIGHT, id: themeBox));
          //   },
          //   child: Text('Light'),
          // ),
        ],
      ),
    );
  }
}
