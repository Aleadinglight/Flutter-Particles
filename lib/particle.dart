import 'package:flutter/material.dart';
import 'dart:math';

class Particle {
  final Color color;
  double xCoor;
  double yCoor;
  final double opacity;
  final double size;
  double xDirection;
  double yDirection;
  static double widgetWidth;
  static double widgetHeight;
  Random random = new Random();

  Particle({
    this.color,
    this.xCoor,
    this.yCoor,
    this.opacity,
    this.size,
  });

  void isNear(Particle anotherParticle) {}
  void getRandomDirection() {
    xDirection = random.nextDouble();
    yDirection = random.nextDouble();
  }

  void move() {
    if (this.xCoor + this.xDirection > Particle.widgetWidth ||
        this.xCoor + this.xDirection < 0) {
      this.xDirection = this.xDirection * (-1);
    }
    if (this.yCoor + this.yDirection > Particle.widgetHeight ||
        this.yCoor + this.yDirection < 0) {
      this.yDirection = this.yDirection * (-1);
    }
    this.xCoor += this.xDirection;
    this.yCoor += this.yDirection;
  }
}
