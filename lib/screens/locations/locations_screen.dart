import 'package:flutter/material.dart';
import 'package:weather_application/consts/consts.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/annotated_scaffold.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'package:weather_application/screens/locations/widgets/location_items.dart';

class LocationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedScaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: ThemedText(
          'Locations',
          themedTextStyle: ThemedTextStyle.H1,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).buttonColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
      body: LocationItems(),
    );
  }
}
