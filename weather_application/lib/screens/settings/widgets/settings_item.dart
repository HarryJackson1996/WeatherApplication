import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/blocs/theme/theme_bloc.dart';
import 'package:weather_application/themes/app_themes.dart';
import '../../../app.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final List<Widget> items;

  SettingsItem({
    this.title,
    this.items,
  });

  int getValue(AppTheme appTheme, Brightness brightness) {
    print(appTheme);
    print(brightness);
    if (appTheme == AppTheme.LIGHT && brightness == Brightness.light) {
      return 0;
    } else if (appTheme == AppTheme.DARK && brightness == Brightness.dark) {
      return 0;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 10.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: GoogleFonts.getFont(
                'Muli',
                textStyle: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                'Light',
              ),
              Radio(
                value: getValue(AppTheme.LIGHT, Theme.of(context).brightness),
                groupValue: 0,
                activeColor: Theme.of(context).indicatorColor,
                focusColor: Theme.of(context).indicatorColor,
                onChanged: (index) {
                  BlocProvider.of<ThemeBloc>(context).add(ThemeUpdatedEvent(theme: AppTheme.LIGHT, id: themeBox));
                },
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Dark',
              ),
              Radio(
                value: getValue(AppTheme.DARK, Theme.of(context).brightness),
                groupValue: 0,
                activeColor: Theme.of(context).indicatorColor,
                focusColor: Theme.of(context).indicatorColor,
                onChanged: (index) {
                  BlocProvider.of<ThemeBloc>(context).add(ThemeUpdatedEvent(theme: AppTheme.DARK, id: themeBox));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
