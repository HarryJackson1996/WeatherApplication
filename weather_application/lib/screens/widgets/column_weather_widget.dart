import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColumnWeatherWidget extends StatelessWidget {
  final String primaryText;
  final IconData iconData;
  final String value;

  ColumnWeatherWidget({
    this.primaryText,
    this.iconData,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        primaryText != null
            ? Expanded(
                child: Container(
                  child: Text(primaryText),
                ),
              )
            : Container(),
        iconData != null
            ? Expanded(
                child: Container(
                  child: Icon(iconData),
                ),
              )
            : Container(),
        value != null
            ? Expanded(
                child: Container(
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
