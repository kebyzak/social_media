import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:social_media_app/generated/l10n.dart';
import 'package:social_media_app/presentation/screens/auth/login_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: IntroductionScreen(
              scrollPhysics: const BouncingScrollPhysics(),
              pages: [
                PageViewModel(
                  titleWidget: Text(
                    S.of(context).onboardFirst,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  bodyWidget: const Text(""),
                  image: Image.asset(
                    "assets/o1.png",
                    height: 500,
                    width: 500,
                  ),
                ),
                PageViewModel(
                  titleWidget: Text(
                    S.of(context).onboardSecond,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  bodyWidget: const Text(""),
                  image: Image.asset(
                    "assets/o2.png",
                    height: 500,
                    width: 500,
                  ),
                ),
                PageViewModel(
                  titleWidget: Text(
                    S.of(context).onboardThird,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  bodyWidget: const Text(""),
                  image: Image.asset(
                    "assets/o3.png",
                    height: 500,
                    width: 500,
                  ),
                ),
              ],
              onDone: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              onSkip: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              showSkipButton: true,
              skip: Text(S.of(context).skip),
              next: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              done: Text(S.of(context).go),
              dotsDecorator: DotsDecorator(
                size: const Size.square(10),
                activeSize: const Size(20, 10),
                color: Colors.grey.shade500,
                activeColor: Colors.black,
                spacing: const EdgeInsets.symmetric(horizontal: 3),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
