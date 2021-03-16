import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final dynamic dividerType;
  final Color color;
  MyDivider({this.dividerType, this.color});
  @override
  Widget build(BuildContext context) {
    return dividerType == VerticalDivider
        ? VerticalDivider(
            thickness: 1.0,
            indent: 8.0,
            endIndent: 8.0,
            color: color,
          )
        : Divider(
            thickness: 1.0,
            indent: 8.0,
            endIndent: 8.0,
            color: color,
          );
  }
}
