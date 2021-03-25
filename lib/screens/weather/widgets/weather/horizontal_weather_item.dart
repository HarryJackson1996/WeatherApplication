import 'package:flutter/material.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_text.dart';

class HorizontalWeatherItem extends StatelessWidget {
  final String primaryText;
  final IconData iconData;
  final String value;

  HorizontalWeatherItem({
    this.primaryText,
    this.iconData,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconData != null
              ? Expanded(
                  flex: 2,
                  child: Container(
                    child: Icon(iconData),
                  ),
                )
              : Container(),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  primaryText != null
                      ? Container(
                          child: ThemedText(
                            primaryText,
                          ),
                        )
                      : Container(),
                  value != null
                      ? Container(
                          child: ThemedText(
                            value,
                            themedTextStyle: ThemedTextStyle.H3,
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
