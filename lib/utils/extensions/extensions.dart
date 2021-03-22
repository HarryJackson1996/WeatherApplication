import 'package:flutter/material.dart';
import '../enums.dart';

extension Capitalise on String {
  String capitalise() {
    return this[0].toUpperCase() + this.substring(1);
  }
}

extension DateExtension on DateTime {
  DateTime addDate(String timezone) {
    return this.add(Duration(seconds: int.parse(timezone)));
  }

  DateTime subtractDate(String timezone) {
    return this.subtract(Duration(seconds: int.parse(timezone).abs()));
  }
}

extension ThemeTextMapping on ThemedTextStyle {
  TextStyle getCustomTextStyle(
    BuildContext context,
    double fontSize,
  ) {
    switch (this) {
      case ThemedTextStyle.H1:
        return Theme.of(context).textTheme.headline1.copyWith(fontSize: fontSize);
        break;
      case ThemedTextStyle.H2:
        return Theme.of(context).textTheme.headline2.copyWith(fontSize: fontSize);
        break;
      case ThemedTextStyle.H3:
        return Theme.of(context).textTheme.headline3.copyWith(fontSize: fontSize);
        break;
      case ThemedTextStyle.BODY:
        return Theme.of(context).textTheme.bodyText1.copyWith(fontSize: fontSize);
        break;
      default:
        return Theme.of(context).textTheme.bodyText1.copyWith(fontSize: fontSize);
        break;
    }
  }
}

extension Animator on Widget {
  Widget animate(
    AnimationController controller, {
    Offset offset = const Offset(0.0, 0.0),
    double start = 0.0,
    double end = 1.0,
    Curve curve = Curves.linear,
    AnimationType animationType = AnimationType.FADE,
  }) {
    switch (animationType) {
      case AnimationType.FADE:
        return FadeTransition(
          opacity: fadeAnimator(controller, start, end, curve),
          child: this,
        );
        break;
      case AnimationType.TRANSITION:
        return SlideTransition(
          position: transitionAnimator(controller, offset, start, end, curve),
          child: this,
        );
        break;
      case AnimationType.FADETRANSITION:
        return SlideTransition(
          position: transitionAnimator(controller, offset, start, end, curve),
          child: FadeTransition(
            opacity: fadeAnimator(controller, start, end, curve),
            child: this,
          ),
        );
        break;
      case AnimationType.NONE:
        return this;
        break;
      default:
        return this;
        break;
    }
  }

  Animation<Offset> transitionAnimator(
    AnimationController controller,
    Offset offset,
    double start,
    double end,
    Curve curve,
  ) {
    Animation<Offset> _animation = Tween<Offset>(begin: offset, end: Offset(0.0, 0.0)).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(start, end, curve: curve),
      ),
    );

    return _animation;
  }

  Animation<double> fadeAnimator(
    AnimationController controller,
    double start,
    double end,
    Curve curve,
  ) {
    Animation<double> _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(start, end, curve: curve),
      ),
    );

    return _animation;
  }
}
