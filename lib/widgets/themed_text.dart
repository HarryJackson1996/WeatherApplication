import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/utils/enums.dart';
import '../utils/extensions/extensions.dart';

class ThemedText extends StatelessWidget {
  final String text;
  final ThemedTextStyle themedTextStyle;
  final String font;
  final double fontSize;
  final TextAlign textAlign;

  ThemedText(
    this.text, {
    this.themedTextStyle = ThemedTextStyle.DEFAULT,
    this.font = 'Muli',
    this.fontSize,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return themedTextStyle == ThemedTextStyle.DEFAULT
        ? Text(
            text,
            textAlign: textAlign,
          )
        : Text(
            text,
            textAlign: textAlign,
            style: GoogleFonts.getFont(
              font,
              textStyle: themedTextStyle.getCustomTextStyle(context, fontSize),
            ),
          );
  }
}
