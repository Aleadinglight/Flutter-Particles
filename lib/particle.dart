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

  void getRandomDirection() {
    xDirection = random.nextDouble();
    yDirection = random.nextDouble();
  }

  void move() {
    if (this.xCoor + this.xDirection > Particle.widgetWidth &&
        this.yCoor + this.yDirection > Particle.widgetHeight) {
      this.xDirection = this.xDirection * (-1);
      this.yDirection = this.yDirection * (-1);
    }
    this.xCoor += this.xDirection;
    this.yCoor += this.yDirection;
  }
}
