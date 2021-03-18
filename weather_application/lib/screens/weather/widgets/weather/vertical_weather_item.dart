import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  child: Text(primaryText),
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
                  child: Text(
                    value,
                    style: GoogleFonts.getFont(
                      'Muli',
                      textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0),
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
