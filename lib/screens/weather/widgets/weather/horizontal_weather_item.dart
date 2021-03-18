import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Row(
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
                        child: Text(primaryText),
                      )
                    : Container(),
                value != null
                    ? Container(
                        child: Text(
                          value,
                          style: GoogleFonts.getFont(
                            'Muli',
                            textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
