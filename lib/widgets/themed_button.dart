import 'package:flutter/material.dart';

import 'themed_text.dart';

class ThemedButton extends StatelessWidget {
  final Function function;
  final String text;
  final Color textColor;
  final double buttonHeight;
  final double radius;

  ThemedButton({
    this.function,
    this.text,
    this.textColor,
    this.buttonHeight = 40.0,
    this.radius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        onPrimary: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
      onPressed: function,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: buttonHeight,
        child: Center(
          child: ThemedText(
            text,
            textColor: textColor,
          ),
        ),
      ),
    );
  }
}
