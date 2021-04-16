import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_application/consts/consts.dart';
import 'package:weather_application/screens/search/search_screen.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_button.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'package:weather_application/utils/extensions/extensions.dart';

class OnboardingPage2 extends StatefulWidget {
  final int index;
  final PageController pageController;

  OnboardingPage2({
    this.index,
    this.pageController,
  });

  @override
  _OnboardingPage2State createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 450), vsync: this);
    Timer(Duration(milliseconds: 150), () {
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
              width: double.infinity,
              padding: EdgeInsets.only(left: 60.0, right: 60.0, top: 100.0, bottom: 50.0),
              child: Image.asset(
                'assets/images/onboarding/onboarding_2.png',
              ),
            ).animate(
              _controller,
              animationType: AnimationType.FADETRANSITION,
              curve: Curves.easeOut,
              start: 0.20,
              end: 0.60,
              offset: Offset(0.3, 0.0),
            ),
          ),
          Container(
            height: 80.0,
            child: Center(
              child: ThemedText(
                'Location',
                themedTextStyle: ThemedTextStyle.H1,
                fontSize: 40.0,
              ),
            ),
          ).animate(
            _controller,
            animationType: AnimationType.FADETRANSITION,
            curve: Curves.easeOut,
            start: 0.35,
            end: 0.75,
            offset: Offset(0.3, 0.0),
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
              start: 0.50,
              end: 0.90,
              offset: Offset(0.3, 0.0),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: ThemedButton(
                    text: 'Enable',
                    textColor: Colors.white,
                    buttonHeight: 60.0,
                    radius: 30.0,
                    function: () {
                      Navigator.of(context).pushNamed(homeRoute);
                    },
                  ),
                ),
                Center(
                  child: ThemedButton(
                    text: 'Disable',
                    textColor: Colors.white,
                    buttonHeight: 60.0,
                    radius: 30.0,
                    function: () {
                      showSearch(
                        context: context,
                        delegate: SearchScreen(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ).animate(
            _controller,
            animationType: AnimationType.FADETRANSITION,
            curve: Curves.easeOut,
            start: 0.65,
            end: 1,
            offset: Offset(0.3, 0.0),
          ),
        ],
      ),
    );
  }
}
