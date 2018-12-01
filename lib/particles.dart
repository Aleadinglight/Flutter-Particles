import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:particle/particle.dart';
import 'package:particle/drawPoints.dart';
import 'package:particle/drawLine.dart';
import 'dart:math';

class Particles extends StatefulWidget {
  Particles({Key key}) : super(key: key);
  @override
  ParticlesState createState() => new ParticlesState();
}

class ParticlesState extends State<Particles>
    with SingleTickerProviderStateMixin {
  // When millisecondPasted reach a value, we change the particle direction
  int millisecondPasted;
  Animation animation;
  AnimationController animationController;
  Random random = new Random();

  List<Particle> pointsList = new List();

  void addToPointList() {
    for (int i = 1; i <= 5; i++) {
      pointsList.add(
        new Particle(
          color: Colors.white,
          xCoor: random.nextDouble() * 400 + 10,
          yCoor: random.nextDouble() * 400 + 10,
          opacity: 1.0,
          size: random.nextDouble() * 3 + 3.0,
        ),
      );
    }
  }

  @override
  void initState() {
    print("init");
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );

    // Add the point the PointLists
    addToPointList();

    // Init random direction to all the points
    for (var point in pointsList) {
      point.getRandomDirection();
    }

    // Add listener
    animationController.addListener(() {
      setState(() {
        for (var point in this.pointsList) {
          point.move();
          for (var anotherPoint in this.pointsList) {
            if (point.isNear(anotherPoint)) {
              DrawLine(
                x1: point.xCoor,
                x2: point.yCoor,
                y1: anotherPoint.xCoor,
                y2: anotherPoint.yCoor,
                color: point.color,
              );
            }
          }
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
    print("build");
    Particle.widgetHeight = MediaQuery.of(context).size.height;
    Particle.widgetWidth = MediaQuery.of(context).size.width;
    return new CustomPaint(
      foregroundPainter: DisplayPoints(
        pointsList: pointsList,
      ),
    );
  }
}

// class MovingParticle extends AnimatedWidget {
//   final Particle a;

//   MovingParticle({
//     this.a,
//   });

//   @override
//   Widget build(BuildContext context) {
//     a.move();
//     return new CustomPaint(
//       foregroundPainter: a,
//     );
//   }
// }
