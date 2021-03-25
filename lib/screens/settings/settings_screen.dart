import 'package:flutter/material.dart';
import 'package:weather_application/consts/screen_consts.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/annotated_scaffold.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'widgets/settings_item.dart';
import '../../utils/extensions/extensions.dart';

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
        padding: EdgeInsets.only(left: textPadding, right: textPadding, top: myPadding / 2),
        child: Column(
          children: [
            SettingsItem(
              title: 'Theme',
            )
          ],
        ),
      ).addTopbarPadding(),
    );
  }
}
