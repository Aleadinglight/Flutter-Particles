import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:particle/particle.dart';
import 'package:particle/drawParticles.dart';
import 'dart:math';

class Particles extends StatefulWidget {
  final int numParticle;
  final Color particlesColor;
  Particles(
    this.numParticle,
    this.particlesColor,
  );
  @override
  ParticlesState createState() => new ParticlesState();
}

class ParticlesState extends State<Particles>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  Random random = new Random();

  List<Particle> particlesList = new List();

  void addToParticlesList() {
    for (int i = 1; i <= widget.numParticle; i++) {
      // Added particle to particlesList
      particlesList.add(
        new Particle(
          color: widget.particlesColor,
          xCoor: random.nextDouble() * 400 + 10,
          yCoor: random.nextDouble() * 400 + 10,
          opacity: 1.0,
          size: 3.0,
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
      ),
    );
  }
}
