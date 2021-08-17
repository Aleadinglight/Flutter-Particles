import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_particles/draw_particles.dart';
import 'package:flutter_particles/particle.dart';

class Particles extends StatefulWidget {
  final int numParticle;
  final Color particlesColor;
  final double strokeSize;
  final double particleSize;
  final double connectDistance;
  final double minSpeed;
  final double maxSpeed;

  Particles(this.numParticle, this.particlesColor,
      {this.particleSize = 3.0,
      this.strokeSize = 2.0,
      this.connectDistance = 100.0,
      this.minSpeed = 0.1,
      this.maxSpeed = 3.0});

  @override
  ParticlesState createState() => new ParticlesState();
}

class ParticlesState extends State<Particles>
    with SingleTickerProviderStateMixin {
  Animation? animation;
  late AnimationController animationController;
  Random random = new Random();

  List<Particle> particlesList = [];

  void addToParticlesList() {
    for (int i = 1; i <= widget.numParticle; i++) {
      // Added particle to particlesList
      particlesList.add(
        new Particle(
          color: widget.particlesColor,
          xCoor: random.nextDouble() * 400 + 10,
          yCoor: random.nextDouble() * 400 + 10,
          size: widget.particleSize,
          connectDistance: widget.connectDistance,
          minSpeed: widget.minSpeed,
          maxSpeed: widget.minSpeed,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );

    // Add the point the PointLists
    addToParticlesList();

    // Init random direction to all the points
    for (var particle in particlesList) {
      particle.getRandomDirection();
    }

    // Add listener
    animationController.addListener(() {
      setState(() {
        for (var particle in this.particlesList) {
          particle.move();
        }
      });
    });
    // Repeat the animation
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Particle.widgetHeight = MediaQuery.of(context).size.height;
    Particle.widgetWidth = MediaQuery.of(context).size.width;
    return new CustomPaint(
      foregroundPainter: DisplayPoints(
        particlesList: particlesList,
        strokeSize: widget.strokeSize,
      ),
    );
  }
}
