import 'package:flutter/material.dart';
import 'dart:math';

class Particle extends CustomPainter {
  final Color color;
  final double xCoor;
  final double yCoor;
  final double opacity;
  final double size;

  Random random = new Random();

  Particle({
    this.color,
    this.xCoor,
    this.yCoor,
    this.opacity,
    this.size,
  });

  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
