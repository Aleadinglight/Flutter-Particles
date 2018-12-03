import 'package:flutter/material.dart';
import 'dart:math';

const double CONNECT_DISTANCE = 100.0;
const double PARTICLE_SPEED = 3.0;

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

  bool isNear(Particle anotherParticle) {
    // Calculate the distance between two particles
    double distance = (this.xCoor - anotherParticle.xCoor) *
            (this.xCoor - anotherParticle.xCoor) +
        (this.yCoor - anotherParticle.yCoor) *
            (this.yCoor - anotherParticle.yCoor);

    if (sqrt(distance) <= CONNECT_DISTANCE) {
      return true;
    }
    return false;
  }

  void getRandomDirection() {
    xDirection = random.nextDouble();
    yDirection = random.nextDouble();
  }

  void move() {
    // Make the particle bounce when it reaches the borders
    if (this.xCoor + this.xDirection > Particle.widgetWidth ||
        this.xCoor + this.xDirection < 0) {
      this.xDirection = this.xDirection * (-1);
    }
    if (this.yCoor + this.yDirection > Particle.widgetHeight ||
        this.yCoor + this.yDirection < 0) {
      this.yDirection = this.yDirection * (-1);
    }
    this.xCoor += this.xDirection * PARTICLE_SPEED;
    this.yCoor += this.yDirection * PARTICLE_SPEED;
  }
}
