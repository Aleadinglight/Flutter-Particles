import 'package:flutter/material.dart';
import 'package:particle/particle.dart';
import 'package:flutter/animation.dart';

class Particles extends StatefulWidget {
  Particles({Key key}) : super(key: key);
  @override
  ParticlesState createState() => new ParticlesState();
}

class ParticlesState extends State<Particles>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  Particle a = new Particle(
    color: Colors.white,
    xCoor: 200.0,
    yCoor: 300.0,
    opacity: 1.0,
    size: 3.0,
  );

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 4000),
      vsync: this,
    );

    animationController.addListener(() {
      setState(() {
        this.a.move();
      });
    });
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      foregroundPainter: a,
    );
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
