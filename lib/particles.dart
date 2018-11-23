import 'package:flutter/material.dart';
import 'package:particle/particle.dart';
import 'package:flutter/animation.dart';

class Particles extends StatefulWidget {
  Particles({Key key}) : super(key: key);
  @override
  _Particles_State createState() => new _Particles_State();
}

class _Particles_State extends State<Particles>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  Particle a = new Particle(
    color: Colors.black,
    xCoor: 200.0,
    yCoor: 300.0,
    opacity: 1.0,
    size: 3.0,
  );

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    animationController.addListener(() {
      setState(() {
        a.move();
      });
    });
    animationController.forward();
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
}
