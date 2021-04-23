import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_button.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'package:weather_application/utils/extensions/extensions.dart';

class OnboardingPage1 extends StatefulWidget {
  final int index;
  final PageController pageController;

  OnboardingPage1({
    this.index,
    this.pageController,
  });

  @override
  _OnboardingPage1State createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    Timer(Duration(milliseconds: 250), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.only(left: 60.0, right: 60.0, top: 100.0, bottom: 50.0),
              child: Image.asset(
                'assets/images/onboarding/onboarding_1.png',
                fit: BoxFit.fill,
              ),
            ).animate(
              _controller,
              animationType: AnimationType.FADETRANSITION,
              curve: Curves.easeOut,
              start: 0.1,
              end: 0.4,
              offset: Offset(0.0, -0.2),
            ),
          ),
          Container(
            height: 80.0,
            child: Center(
              child: ThemedText(
                'Welcome',
                themedTextStyle: ThemedTextStyle.H1,
                fontSize: 40.0,
              ),
            ),
          ).animate(
            _controller,
            animationType: AnimationType.FADETRANSITION,
            curve: Curves.easeOut,
            start: 0.2,
            end: 0.5,
            offset: Offset(0.0, -0.5),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: Center(
                child: ThemedText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur adipiscing elit. Lacus laoreet non curabitur gravida arcu. Tortor condimentum lacinia quis vel eros.',
                  themedTextStyle: ThemedTextStyle.BODY,
                  lineSpacing: 1.5,
                  letterSpacing: 0.5,
                ),
              ),
            ).animate(
              _controller,
              animationType: AnimationType.FADETRANSITION,
              curve: Curves.easeOut,
              start: 0.3,
              end: 0.6,
              offset: Offset(0.0, -0.3),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: ThemedButton(
                text: 'Next',
                textColor: Colors.white,
                buttonHeight: 50.0,
                radius: 30.0,
                function: () {
                  widget.pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                },
              ),
            ),
          ).animate(
            _controller,
            animationType: AnimationType.FADETRANSITION,
            curve: Curves.easeOut,
            start: 0.5,
            end: 0.8,
            offset: Offset(0, -0.2),
          ),
        ],
      ),
    );
  }
}
