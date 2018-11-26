import 'package:flutter/material.dart';
import 'package:particle/particle.dart';
import 'dart:math';

class DisplayPoints extends CustomPainter {
  final List<Particle> pointsList;

  DisplayPoints({
    this.pointsList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var point in pointsList) {
      Paint line = new Paint();
      line.strokeCap = StrokeCap.round;
      line.color = point.color;
      line.strokeWidth = point.size;
      Offset center = new Offset(point.xCoor, point.yCoor);
      line.style = PaintingStyle.fill;
      canvas.drawCircle(center, point.size, line);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
