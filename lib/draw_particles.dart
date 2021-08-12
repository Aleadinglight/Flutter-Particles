import 'package:flutter/material.dart';
import 'package:flutter_particles/particle.dart';

class DisplayPoints extends CustomPainter {
  final List<Particle> particlesList;

  final double strokeSize;

  DisplayPoints({
    this.particlesList,
    this.strokeSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint();
    line.strokeCap = StrokeCap.round;
    line.color = particlesList.elementAt(0).color;

    // Draw all the particles
    for (var particle in particlesList) {
      line.strokeWidth = particle.size;
      Offset center = new Offset(particle.xCoor, particle.yCoor);
      line.style = PaintingStyle.fill;
      canvas.drawCircle(center, particle.size, line);
    }

    // Draw the connect line
    for (int i = 0; i < this.particlesList.length; i++) {
      for (int j = i + 1; j < this.particlesList.length; j++) {
        Particle particle = this.particlesList.elementAt(i);
        Particle anotherParticle = this.particlesList.elementAt(j);
        if (particle.isNear(anotherParticle)) {
          Offset firstParticle = new Offset(particle.xCoor, particle.yCoor);
          Offset secondParticle =
              new Offset(anotherParticle.xCoor, anotherParticle.yCoor);
          line.strokeWidth = strokeSize;
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
