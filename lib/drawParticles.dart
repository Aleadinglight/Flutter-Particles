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
    Paint line = new Paint();
    line.strokeCap = StrokeCap.round;
    line.color = pointsList.elementAt(0).color;

    // Draw all the particles
    for (var point in pointsList) {
      line.strokeWidth = point.size;
      Offset center = new Offset(point.xCoor, point.yCoor);
      line.style = PaintingStyle.fill;
      canvas.drawCircle(center, point.size, line);
    }

    // Draw the connect line
    for (int i = 0; i < this.pointsList.length; i++) {
      for (int j = i + 1; j < this.pointsList.length; j++) {
        Particle point = this.pointsList.elementAt(i);
        Particle anotherPoint = this.pointsList.elementAt(j);
        if (point.isNear(anotherPoint)) {
          Offset firstParticle = new Offset(point.xCoor, point.yCoor);
          Offset secondParticle =
              new Offset(anotherPoint.xCoor, anotherPoint.yCoor);
          line.color = Colors.white;
          line.strokeWidth = 2.0;
          canvas.drawLine(firstParticle, secondParticle, line);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
