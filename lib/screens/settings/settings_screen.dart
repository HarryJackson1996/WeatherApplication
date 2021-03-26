import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/blocs/settings/settings_bloc.dart';
import 'package:weather_application/consts/box_consts.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/annotated_scaffold.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'widgets/settings_item.dart';
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
            ),
            CustomItem(
              title: 'Unit',
            )
          ],
        ),
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  final String title;
  final List<Widget> items;

  CustomItem({
    this.title,
    this.items,
  });

  int getValue(TempUnit unit, TempUnit current) {
    if (current == TempUnit.CELSIUS && unit == TempUnit.CELSIUS) {
      return 0;
    } else if (current == TempUnit.FAHRENHEIT && unit == TempUnit.FAHRENHEIT) {
      return 0;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 10.0),
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
                    'Celisus',
                  ),
                  Radio(
                    value: getValue(BlocProvider.of<SettingsBloc>(context).state.settings.tempUnit, TempUnit.CELSIUS),
                    groupValue: 0,
                    activeColor: Theme.of(context).indicatorColor,
                    focusColor: Theme.of(context).indicatorColor,
                    onChanged: (index) async => BlocProvider.of<SettingsBloc>(context).add(TempUpdatedEvent(settingsBox, TempUnit.CELSIUS)),
                  ),
                ],
              ),
              Row(
                children: [
                  ThemedText(
                    'Fahrenheit',
                  ),
                  Radio(
                    value: getValue(BlocProvider.of<SettingsBloc>(context).state.settings.tempUnit, TempUnit.FAHRENHEIT),
                    groupValue: 0,
                    activeColor: Theme.of(context).indicatorColor,
                    focusColor: Theme.of(context).indicatorColor,
                    onChanged: (index) async => BlocProvider.of<SettingsBloc>(context).add(TempUpdatedEvent(settingsBox, TempUnit.FAHRENHEIT)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
