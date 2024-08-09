import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hockey/animation.dart';
import 'package:hockey/game_instructions.dart';
import 'package:hockey/manage_sound.dart';
import 'package:hockey/select_game.dart';

import 'menu_button.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with WidgetsBindingObserver {
    @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    ManageSound.stopGameSound();
    super.dispose();
  }

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
              const SizedBox(height: 20),
              MenuButton(
                text: 'Start Game',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectGame(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              MenuButton(
                text: 'Instructions',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameInstructions(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              MenuButton(
                text: 'Settings',
                onPressed: () {
                  // Add action for Settings
                },
              ),
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
