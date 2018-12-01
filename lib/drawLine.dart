import 'package:flutter/material.dart';
import 'package:particle/particle.dart';
import 'dart:math';

class DrawLine extends CustomPainter {

  final double x1, y1, x2, y2; 
  DrawLine({
    this.x1,
    this.y1,
    this.x2,
    this.y2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    
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
