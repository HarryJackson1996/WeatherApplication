import 'package:flutter/material.dart';

import 'themed_text.dart';

class ThemedButton extends StatelessWidget {
  final Function function;
  final String text;

  ThemedButton({this.function, this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        onPrimary: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onPressed: function,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: ThemedText(text),
      ),
    );
  }
}
