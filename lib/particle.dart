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
    this.xCoor += this.xDirection;
    this.yCoor += this.yDirection;
  }
}
