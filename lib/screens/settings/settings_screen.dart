import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/blocs/settings/settings_bloc.dart';
import 'package:weather_application/blocs/theme/theme_bloc.dart';
import 'package:weather_application/consts/box_consts.dart';
import 'package:weather_application/themes/app_themes.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/annotated_scaffold.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'widgets/settings_item.dart';
import 'package:weather_application/screens/settings/utils/settings_utils.dart';
import 'package:weather_application/models/settings_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedScaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: ThemedText(
          'Settings',
          themedTextStyle: ThemedTextStyle.H1,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).buttonColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            SettingsItem(
              title: 'Theme',
              items: AppTheme.values,
              values: [
                SettingsUtils.getValue(BlocProvider.of<ThemeBloc>(context).state, AppTheme.LIGHT),
                SettingsUtils.getValue(BlocProvider.of<ThemeBloc>(context).state, AppTheme.DARK),
              ],
              onClicks: [
                () {
                  BlocProvider.of<ThemeBloc>(context).add(ThemeUpdatedEvent(
                    theme: AppTheme.LIGHT,
                    id: themeBoxKey,
                  ));
                },
                () {
                  BlocProvider.of<ThemeBloc>(context).add(ThemeUpdatedEvent(
                    theme: AppTheme.DARK,
                    id: themeBoxKey,
                  ));
                },
              ],
            ),
            BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
              return SettingsItem(
                title: 'Unit',
                items: TempUnit.values,
                values: [
                  SettingsUtils.getValue(BlocProvider.of<SettingsBloc>(context).state.settings.tempUnit, TempUnit.CELSIUS),
                  SettingsUtils.getValue(BlocProvider.of<SettingsBloc>(context).state.settings.tempUnit, TempUnit.FAHRENHEIT),
                ],
                onClicks: [
                  () {
                    BlocProvider.of<SettingsBloc>(context).add(TempUpdatedEvent(settingsBoxKey, TempUnit.CELSIUS));
                  },
                  () {
                    BlocProvider.of<SettingsBloc>(context).add(TempUpdatedEvent(settingsBoxKey, TempUnit.FAHRENHEIT));
                  },
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
