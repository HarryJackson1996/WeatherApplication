import 'package:flutter/material.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_text.dart';

class VerticalWeatherWidget extends StatelessWidget {
  final String primaryText;
  final IconData iconData;
  final String value;
  final int primaryFlex;
  final int iconFlex;
  final int valueFlex;

  VerticalWeatherWidget({
    this.primaryText,
    this.primaryFlex = 1,
    this.iconData,
    this.iconFlex = 1,
    this.value,
    this.valueFlex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        primaryText != null
            ? Expanded(
                flex: primaryFlex,
                child: Center(
                  child: ThemedText(
                    primaryText,
                  ),
                ),
              )
            : Container(),
        iconData != null
            ? Expanded(
                flex: iconFlex,
                child: Container(
                  child: Icon(iconData),
                ),
              )
            : Container(),
        value != null
            ? Expanded(
                flex: valueFlex,
                child: Center(
                  child: ThemedText(
                    value,
                    themedTextStyle: ThemedTextStyle.H3,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
