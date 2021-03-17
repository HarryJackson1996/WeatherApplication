import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/app.dart';
import 'package:weather_application/blocs/theme/theme_bloc.dart';
import 'package:weather_application/themes/app_themes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white10,
          title: Text(
            'Settings',
            style: GoogleFonts.getFont(
              'Muli',
              textStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25.0,
                color: Colors.black,
              ),
              letterSpacing: 2.0,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(ThemeUpdatedEvent(theme: AppTheme.DARK, id: themeBox));
              },
              child: Text('Dark'),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(ThemeUpdatedEvent(theme: AppTheme.LIGHT, id: themeBox));
              },
              child: Text('Light'),
            ),
          ],
        ));
  }
}
