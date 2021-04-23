import 'package:flutter/material.dart';
import 'package:weather_application/screens/onboarding/widgets/onboarding_page_1.dart';
import 'package:weather_application/screens/onboarding/widgets/onboarding_page_2.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  child: PageView.builder(
                    pageSnapping: true,
                    controller: _controller,
                    itemCount: 2,
                    allowImplicitScrolling: false,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return index == 0
                          ? OnboardingPage1(
                              index: index,
                              pageController: _controller,
                            )
                          : OnboardingPage2(
                              index: index,
                              pageController: _controller,
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
