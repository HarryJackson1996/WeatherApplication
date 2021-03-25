import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/blocs/theme/theme_bloc.dart';
import 'package:weather_application/consts/box_consts.dart';
import 'package:weather_application/themes/app_themes.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_text.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final List<Widget> items;

  SettingsItem({
    this.title,
    this.items,
  });

  int getValue(AppTheme appTheme, Brightness brightness) {
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
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ThemedText(
              title,
              themedTextStyle: ThemedTextStyle.H2,
            ),
          ),
          Row(
            children: [
              ThemedText(
                'Light',
              ),
              Radio(
                value: getValue(AppTheme.LIGHT, Theme.of(context).brightness),
                groupValue: 0,
                activeColor: Theme.of(context).indicatorColor,
                focusColor: Theme.of(context).indicatorColor,
                onChanged: (index) {
                  BlocProvider.of<ThemeBloc>(context).add(
                    ThemeUpdatedEvent(
                      theme: AppTheme.LIGHT,
                      id: themeBoxKey,
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              ThemedText(
                'Dark',
              ),
              Radio(
                value: getValue(AppTheme.DARK, Theme.of(context).brightness),
                groupValue: 0,
                activeColor: Theme.of(context).indicatorColor,
                focusColor: Theme.of(context).indicatorColor,
                onChanged: (index) {
                  BlocProvider.of<ThemeBloc>(context).add(
                    ThemeUpdatedEvent(
                      theme: AppTheme.DARK,
                      id: themeBoxKey,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
