import 'package:flutter/material.dart';

class ColorChangingText extends StatefulWidget {
  const ColorChangingText({super.key, required this.word});

  final String word;

  @override
  State<ColorChangingText> createState() => _ColorChangingTextState();
}

class _ColorChangingTextState extends State<ColorChangingText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
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
      animation: _colorAnimation,
      builder: (context, child) {
        return Text(
          widget.word,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: _colorAnimation.value,
          ),
        );
      },
    );
  }
}
