import 'package:flutter/material.dart';
import 'package:particle/particle.dart';
import 'dart:math';

class DrawLine extends CustomPainter {

  final double x1, y1, x2, y2;
  final Color color; 
  DrawLine({
    this.x1,
    this.y1,
    this.x2,
    this.y2,
    this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    
      Paint line = new Paint();
      line.strokeCap = StrokeCap.round;
      line.color = this.color;
      line.strokeWidth = 1.0;
      Offset firstParticle = new Offset(x1, x2);
      Offset secondParticle = new Offset(x1, x2);
      line.style = PaintingStyle.fill;
      canvas.drawLine(firstParticle, secondParticle, line);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
