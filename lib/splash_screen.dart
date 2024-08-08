import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hockey/animation.dart';
import 'package:hockey/menu.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/stadium.png",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white.withOpacity(0.3),
        ),
        Center(
          child: AnimatedSplashScreen(
            splash: Column(
              children: [
                Flexible(
                  child: SizedBox(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'PUCK DUEL',
                          textStyle: const TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Color.fromARGB(255, 191, 241, 250),
                            shadows: [
                              Shadow(
                                blurRadius: 5.0,
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            nextScreen: Menu(),
            splashIconSize: 300,
            backgroundColor: Colors.transparent,
          ),
        ),
        Positioned(
          top: 500.0,
          right: 0.0,
          left: 0.0,
          child: LottieBuilder.asset(
            "assets/Lottie/rwineQBatX.json",
            width: 400,
            height: 400,
          ),
        ),
        Positioned(
          top: 250.0,
          right: 0.0,
          left: 0.0,
          child: Center(
            child: Image.asset(
              'assets/images/playing.png',
              height: 300,
            ),
          ),
        ),
        Positioned(
          bottom: 90.0,
          right: 300.0,
          left: 0.0,
          child: AnimatedCircle(),
        ),
        Positioned(
          top: 50.0,
          right: 300.0,
          left: 0.0,
          child: AnimatedCircle(),
        ),
        Positioned(
          top: 90.0,
          right: 0.0,
          left: 100.0,
          child: AnimatedCircle(),
        ),
        Positioned(
          top: 400.0,
          right: 300.0,
          left: 0.0,
          child: AnimatedCircle(),
        ),
        Positioned(
          bottom: 500.0,
          right: 0.0,
          left: 300.0,
          child: AnimatedCircle(),
        ),
        Positioned(
          bottom: 200.0,
          right: 0.0,
          left: 300.0,
          child: AnimatedCircle(),
        ),
      ],
    );
  }
}
