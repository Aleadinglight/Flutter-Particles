import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:particle/particle.dart';
import 'package:particle/drawPoints.dart';

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
  Particle a = new Particle(
    color: Colors.white,
    xCoor: 200.0,
    yCoor: 300.0,
    opacity: 1.0,
    size: 3.0,
  );
  List<Particle> pointsList = new List();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
    // Set sec pasted to 0
    millisecondPasted = 0;
    // Add the point the PointLists
    pointsList.add(a);
    // Add listener
    animationController.addListener(() {
      setState(() {
        // Get new random direction for each point after 5s
        // if (millisecondPasted == 5000) {
        //   for (var point in pointsList) {
        //     point.getRandomDirection();
        //   }
        //   millisecondPasted = 0;
        // }
        // // Make the particle moves
        // millisecondPasted += 100;
        for (var point in this.pointsList) {
          //point.move();
        }
      });
    });
    // Repeat the animation
    animationController.forward();
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
