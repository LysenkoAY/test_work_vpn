import 'package:flutter/material.dart';

class GradientTextAnimation extends StatefulWidget {
  const GradientTextAnimation({super.key, required this.text});

  final String text;

  @override
  State<GradientTextAnimation> createState() => _GradientTextAnimationState();
}

class _GradientTextAnimationState extends State<GradientTextAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(_controller);
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
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: _animation.value,
              end: Alignment(-_animation.value.x, -_animation.value.y),
              colors: const [Colors.blue, Colors.purple, Colors.red],
            ).createShader(bounds);
          },
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        );
      },
    );
  }
}
