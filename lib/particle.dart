import 'package:flutter/material.dart';
import 'dart:math';

class Particle extends CustomPainter {
  final Color color;
  double xCoor;
  double yCoor;
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

  void move() {
    this.xCoor += random.nextDouble();
    this.yCoor += random.nextDouble();
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint();
    line.strokeCap = StrokeCap.round;
    line.color = this.color;
    line.strokeWidth = this.size;
    Offset center = new Offset(xCoor, yCoor);
    line.style = PaintingStyle.fill;

    canvas.drawCircle(center, this.size, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
