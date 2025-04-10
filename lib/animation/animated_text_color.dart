import 'package:flutter/material.dart';

class AnimatedTextColor extends StatefulWidget {
  const AnimatedTextColor({super.key, required this.text});

  final String text;

  @override
  State<AnimatedTextColor> createState() => _AnimatedTextColorState();
}

class _AnimatedTextColorState extends State<AnimatedTextColor> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 4), vsync: this);
    _colorAnimation = ColorTween(begin: Colors.white, end: Colors.red).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(fontSize: 48, fontWeight: FontWeight.w800, color: _colorAnimation.value),
    );
  }
}
