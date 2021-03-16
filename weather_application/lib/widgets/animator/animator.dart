import 'package:flutter/material.dart';

extension Animator on Widget {
  Widget animate(
    AnimationController controller,
    Widget child, {
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
          child: child,
        );
        break;
      case AnimationType.TRANSITION:
        return SlideTransition(
          position: transitionAnimator(controller, offset, start, end, curve),
          child: child,
        );
        break;
      case AnimationType.FADETRANSITION:
        return SlideTransition(
          position: transitionAnimator(controller, offset, start, end, curve),
          child: FadeTransition(
            opacity: fadeAnimator(controller, start, end, curve),
            child: child,
          ),
        );
        break;
      case AnimationType.NONE:
        return child;
        break;
      default:
        return child;
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

// mixin OnboardingAnimator {
//   Widget animator({
//     AnimationController controller,
//     Widget child,
//     Offset offset,
//     double start,
//     double end,
//     Curve curve,
//     AnimationType animationType,
//   }) {
//     switch (animationType) {
//       case AnimationType.FADE:
//         return FadeTransition(
//           opacity: fadeAnimator(controller, start, end, curve),
//           child: child,
//         );
//         break;
//       case AnimationType.TRANSITION:
//         return SlideTransition(
//           position: transitionAnimator(controller, offset, start, end, curve),
//           child: child,
//         );
//         break;
//       case AnimationType.FADETRANSITION:
//         return SlideTransition(
//           position: transitionAnimator(controller, offset, start, end, curve),
//           child: FadeTransition(
//             opacity: fadeAnimator(controller, start, end, curve),
//             child: child,
//           ),
//         );
//         break;
//       case AnimationType.NONE:
//         return child;
//         break;
//       default:
//         return child;
//         break;
//     }
//   }

//   Animation<Offset> transitionAnimator(
//     AnimationController controller,
//     Offset offset,
//     double start,
//     double end,
//     Curve curve,
//   ) {
//     Animation<Offset> _animation = Tween<Offset>(begin: offset, end: Offset(0.0, 0.0)).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: Interval(start, end, curve: curve),
//       ),
//     );

//     return _animation;
//   }

//   Animation<double> fadeAnimator(
//     AnimationController controller,
//     double start,
//     double end,
//     Curve curve,
//   ) {
//     Animation<double> _animation = Tween(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: Interval(start, end, curve: curve),
//       ),
//     );

//     return _animation;
//   }
// }

enum AnimationType { FADE, TRANSITION, FADETRANSITION, NONE }
