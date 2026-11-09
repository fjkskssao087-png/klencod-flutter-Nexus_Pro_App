import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 15))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              top: 100 + 50 * sin(_controller.value * 2 * pi),
              right: 50 + 50 * cos(_controller.value * 2 * pi),
              child: _buildOrb(const Color(0xFF0A84FF), 250),
            ),
            Positioned(
              bottom: 100 + 50 * cos(_controller.value * 2 * pi),
              left: 50 + 50 * sin(_controller.value * 2 * pi),
              child: _buildOrb(const Color(0xFF5E5CE6), 300),
            ),
            Positioned(
              top: 300 + 30 * sin(_controller.value * 2 * pi),
              left: 150 + 30 * cos(_controller.value * 2 * pi),
              child: _buildOrb(const Color(0xFFF093FB), 200),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOrb(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.3), blurRadius: 120, spreadRadius: 20),
        ],
        gradient: RadialGradient(colors: [color.withOpacity(0.4), Colors.transparent]),
      ),
    );
  }
}