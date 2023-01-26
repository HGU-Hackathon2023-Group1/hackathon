import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';
import 'loginPage.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingScreen(
        onSkip: () {
          // TODO : return center login button
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage(),),
          );
        },
        showPrevNextButton: true,
        showIndicator: true,
        backgourndColor: Colors.white,
        activeDotColor: Colors.blue,
        deactiveDotColor: Colors.grey,
        iconColor: Colors.black,
        leftIcon: Icons.arrow_circle_left_rounded,
        rightIcon: Icons.arrow_circle_right_rounded,
        iconSize: 30,
        pages: [
          OnBoardingModel(
            image: Lottie.network('https://assets3.lottiefiles.com/packages/lf20_8QyKOkeQV8.json'),
            title: "Business Chat",
            body:
            "First impressions are everything in business, even in chat service. It’s important to show professionalism and courtesy from the start",
          ),
          OnBoardingModel(
            image: Lottie.network('https://assets3.lottiefiles.com/packages/lf20_8QyKOkeQV8.json'),
            title: "Coffee With Friends",
            body:
            "When your morning starts with a cup of coffee and you are used to survive the day with the same, then all your Instagram stories and snapchat streaks would stay filled up with coffee pictures",
          ),
          OnBoardingModel(
            image: Lottie.network('https://assets3.lottiefiles.com/packages/lf20_8QyKOkeQV8.json'),
            title: "Mobile Application",
            body:
            "Mobile content marketing has also been found to enhance quick online actions and make follow-ups easier.",
          ),
          OnBoardingModel(
            image: Lottie.network('https://assets3.lottiefiles.com/packages/lf20_8QyKOkeQV8.json'),
            title: "Content Team",
            body: "No two content marketing teams look the same.",
          ),
        ],
      ),
    );
  }
}

