import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hockey/animation.dart';
import 'package:hockey/menu_button.dart';

import 'package:hockey/select_game.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'PUCK DUEL',
                        textAlign: TextAlign.center,
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
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Difficulty',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(186, 221, 42, 29),
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              MenuButton(
                text: 'Easy',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              MenuButton(
                text: 'Medium',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              MenuButton(
                text: 'Hard',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              MenuButton(
                text: 'Insane',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              MenuButton(
                text: 'Back',
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
            ],
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
      ),
    );
  }
}
