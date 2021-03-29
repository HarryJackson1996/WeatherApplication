import 'package:flutter/material.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'package:weather_application/screens/settings/utils/settings_utils.dart';

class SettingsRowItem extends StatelessWidget {
  final String title;
  final dynamic item;
  final int value;
  final Function onClick;

  const SettingsRowItem({
    this.title,
    this.item,
    this.value,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ThemedText(SettingsUtils.convert(item.toString())),
          Radio(
            value: value,
            groupValue: 0,
            activeColor: Theme.of(context).indicatorColor,
            focusColor: Theme.of(context).indicatorColor,
            onChanged: (index) {
              onClick();
            },
          ),
        ],
      ),
    );
  }
}
