import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hockey/animation.dart';

import 'package:hockey/select_game.dart';

class Difficulty extends StatefulWidget {
  @override
  _DifficultyState createState() => _DifficultyState();
}

class _DifficultyState extends State<Difficulty>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002060),
      body: SafeArea(
        child: Stack(
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
                _buildButton(
                  text: 'Easy',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                _buildButton(
                  text: 'Medium',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                _buildButton(
                  text: 'Hard',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                _buildButton(
                  text: 'Insane',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                _buildButton(
                  text: 'Back',
                  icon: Icons.arrow_back,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectGame(),
                      ),
                    );
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
      ),
    );
  }

  Widget _buildButton(
      {required String text, required VoidCallback onPressed, IconData? icon}) {
    return Center(
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 154, 184, 243),
              Color.fromARGB(255, 208, 223, 238)
              // Color(0xFF002060),
              // Color(0xFF0050A0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 5,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, color: Colors.black),
              const Spacer(),
              Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
