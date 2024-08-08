import 'package:flutter/material.dart';

class AnimatedCircle extends StatefulWidget {
  @override
  _AnimatedCircleState createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 10.0, end: 20.0).animate(_controller);
    _animation = Tween<double>(begin: 5.0, end: 10.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Center(
          child: Container(
            width: _animation.value,
            height: _animation.value,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.white,
                )),
          ),
        );
      },
    );
  }
}
