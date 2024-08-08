import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hockey/animation.dart';
import 'package:hockey/menu.dart';

class GameInstructions extends StatelessWidget {
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
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0), 
                child: Center(
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
              const Spacer(), 
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Game Instructions go here...',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Spacer(), 
              Padding(
                padding: const EdgeInsets.all(25),
                child: _buildButton(
                  text: 'Back',
                  icon: Icons.arrow_back,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Menu(),
                      ),
                    );
                  },
                ),
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

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    IconData? icon,
  }) {
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
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
