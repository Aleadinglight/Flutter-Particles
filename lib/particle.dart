// ignore_for_file: unnecessary_statements

import 'dart:math';

import 'package:flutter/material.dart';

class Particle {
  final Color? color;
  final double yCoor;
  final double xCoor;
  final double? size;
  late double xDirection;
  late double yDirection;
  static late double widgetWidth;
  static late double widgetHeight;
  double connectDistance;
  Random random = new Random();
  double minSpeed;
  double maxSpeed;

  Particle({
    this.color,
    required this.xCoor,
    required this.yCoor,
    this.size,
    this.connectDistance = 100.0,
    this.minSpeed = 0.1,
    this.maxSpeed = 3.0,
  });

  bool isNear(Particle anotherParticle) {
    // Calculate the distance between two particles
    double distance = (this.xCoor - anotherParticle.xCoor) *
            (this.xCoor - anotherParticle.xCoor) +
        (this.yCoor - anotherParticle.yCoor) *
            (this.yCoor - anotherParticle.yCoor);

    if (sqrt(distance) <= connectDistance) {
      return true;
    }
    return false;
  }

  void getRandomDirection() {
    xDirection = doubleInRange(minSpeed, maxSpeed);
    yDirection = doubleInRange(minSpeed, maxSpeed);
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
    this.xCoor + this.xDirection;
    this.yCoor + this.yDirection;
  }

  double doubleInRange(double start, double end) =>
      random.nextDouble() * (end - start) + start;
}
