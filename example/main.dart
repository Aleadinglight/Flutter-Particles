// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_particles/particles.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _MyHomePageStateCustom createState() => new _MyHomePageStateCustom();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellow[100],
      body: new Particles(
        30, // Number of Particles
        Colors.blue, // Color of Particles
      ),
    );
  }
}

class _MyHomePageStateCustom extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.orange[50],
      body: new Particles(
        30, // Number of Particles
        Colors.blue, // Color of Particles
        particleSize: 5.0, //Size of Particles
        strokeSize: 4.0, //Size of stroke between particles
        connectDistance: 50.0, //Distance between particles to connect
        minSpeed: 2, //Minimum speed of a particle
        maxSpeed: 5, //Maximum speed of a particle
      ),
    );
  }
}
