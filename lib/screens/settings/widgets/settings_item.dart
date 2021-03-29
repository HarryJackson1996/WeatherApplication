import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'package:weather_application/screens/settings/widgets/setting_row_item.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final List<dynamic> items;
  final List<int> values;
  final List<Function> onClicks;
  SettingsItem({
    this.title,
    this.items,
    this.values,
    this.onClicks,
  });

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
          for (int i = 0; i < items.length; i++) ...{
            SettingsRowItem(
              item: items[i],
              value: values[i],
              onClick: onClicks[i],
            ),
          }

        ],
      ),
    );
  }
}
