import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnnotatedScaffold extends StatelessWidget {
  final Widget body;
  final bool resizeKeyboard;
  final AppBar appBar;

  AnnotatedScaffold({
    this.body,
    this.appBar,
    this.resizeKeyboard = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).backgroundColor,
        systemNavigationBarIconBrightness: Theme.of(context).primaryColorBrightness,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: resizeKeyboard,
        appBar: appBar,
        body: body,
        extendBodyBehindAppBar: true,
      ),
    );
  }
}
